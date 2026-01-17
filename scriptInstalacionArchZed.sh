#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Requerido: ejecutar como root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script debe ejecutarse como root." >&2
  exit 1
fi

BASHRC="$HOME/.bashrc"

# Function: Add a line if no exist (nota: simple append)
append_once() {
  local file="$1"; shift
  local snippet="$*"
  echo "$snippet" >> "$file"
}

# Update
pacman -Syu --noconfirm

# Dependencies
pacman -Syu --noconfirm tmux git curl fzf python npm go docker terraform unzip patch base-devel

# pyenv setup
if [[ ! -d "$HOME/.pyenv" ]]; then
  git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv"
fi
append_once "$BASHRC" 'export PATH="$HOME/.pyenv/bin:$PATH"'
append_once "$BASHRC" 'eval "$(pyenv init --path)"'
append_once "$BASHRC" 'eval "$(pyenv init -)"'

# bun installation
curl -fsSL https://bun.sh/install | bash

# TMUX TPM + conf
TPM_DIR="$HOME/.tmux/plugins/tpm"
TMUX_CONF_URL="https://raw.githubusercontent.com/Jufedev/nvim/main/tmux/.tmux.conf"

if [[ ! -d "$TPM_DIR" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

curl -fsSL "$TMUX_CONF_URL" -o "$HOME/.tmux.conf" || true

# fzf history search
append_once "$BASHRC" '# Función para buscar historial con fzf e insertar el resultado'
append_once "$BASHRC" '__fzf_history__() {'
append_once "$BASHRC" '  local selected'
append_once "$BASHRC" "  selected=\$(history | tac | sed 's/^[[:space:]]*[0-9]*[[:space:]]*//' | awk '!seen[\$0]++' | fzf --height 40% --layout=reverse --border) || return"
append_once "$BASHRC" '  if [[ -n $selected ]]; then'
append_once "$BASHRC" '    READLINE_LINE=$selected'
append_once "$BASHRC" '    READLINE_POINT=${#selected}'
append_once "$BASHRC" '  fi'
append_once "$BASHRC" '}'
append_once "$BASHRC" ''
append_once "$BASHRC" '# Asocia Ctrl-R a __fzf_history__ en shells interactivas'
append_once "$BASHRC" 'if [[ $- == *i* ]]; then'
append_once "$BASHRC" '  bind -x "\"\C-r\": \"__fzf_history__\"\""'
append_once "$BASHRC" 'fi'

# Crear wrapper tmux-shell (Conflictos con ZED)
WRAPPER_PATH="/usr/local/bin/tmux-shell"

mkdir -p "$(dirname "$WRAPPER_PATH")"

cat > "$WRAPPER_PATH" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

# Descarta -i si está presente
args=()
for a in "$@"; do
  [ "$a" = "-i" ] && continue
  args+=("$a")
done

# Si no hay TTY (ejecución no interactiva) -> shell normal
if ! [ -t 0 ] || ! [ -t 1 ]; then
  exec /bin/bash "${args[@]}"
fi

# Si ya estamos dentro de tmux -> shell normal
if [ -n "${TMUX:-}" ]; then
  exec /bin/bash "${args[@]}"
fi

# Iniciar / adjuntar sesión tmux nombrada
exec /usr/sbin/tmux new -As jufe
EOF

chmod +x "$WRAPPER_PATH"

# Cambiar shell a /usr/local/bin/tmux-shell de forma segura
if command -v usermod >/dev/null 2>&1; then
  usermod -s "$WRAPPER_PATH" root
else
  # Fallback: reemplazo seguro usando awk
  awk -F: 'BEGIN{OFS=FS} $1=="root"{$NF="'$WRAPPER_PATH'"}{print}' /etc/passwd > /tmp/passwd.new
  mv /tmp/passwd.new /etc/passwd
  chmod 644 /etc/passwd
fi

# Docker setup note
systemctl enable docker || echo "Configure docker manualmente en WSL (systemctl puede no estar disponible)."

echo " ---------------- Instalación y configuración completadas. ------------------ "
echo "Wrapper tmux-shell instalado en: $WRAPPER_PATH"
echo "Se ha actualizado /etc/passwd."
