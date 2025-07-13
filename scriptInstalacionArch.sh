#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Directorios
NVIM_TARBALL_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
NVIM_TARBALL="/tmp/nvim-linux-x86_64.tar.gz"
NVIM_DEST="/opt/nvim"

NVIM_CONFIG_REPO="https://github.com/Jufedev/nvim.git"
NVIM_CONFIG_DIR="$HOME/.config/nvim"

TPM_DIR="$HOME/.tmux/plugins/tpm"
TMUX_CONF_URL="https://raw.githubusercontent.com/Jufedev/nvim/main/tmux/.tmux.conf"

BASHRC="$HOME/.bashrc"

# Función: añade una línea a un archivo si no existe ya
append_once() {
  local file="$1"; shift
  local snippet="$*"
  echo "$snippet" >> "$file"
}

# Dependencias
pacman -Syu --noconfirm tmux git curl fzf python npm

# Descargar y descomprimir el .tar de nvim
curl -sL "$NVIM_TARBALL_URL" -o "$NVIM_TARBALL"

rm -rf "$NVIM_DEST"
mkdir -p "$(dirname "$NVIM_DEST")"
tar -xzf "$NVIM_TARBALL" -C /opt
mv /opt/nvim-linux-x86_64 "$NVIM_DEST"

rm -f "$NVIM_TARBALL"

# Añadir enlace de nvim y comprobar su instalacion
ln -sf "$NVIM_DEST/bin/nvim" /usr/local/bin/nvim
nvim --version | head -n1

# Clonar mi configuracion de nvim
git clone --no-checkout --filter=blob:none "$NVIM_CONFIG_REPO" "$NVIM_CONFIG_DIR"
cd "$NVIM_CONFIG_DIR"
git sparse-checkout init --cone
git sparse-checkout set nvim
git checkout main

mv nvim/* .
rm -rf nvim
rm -rf .git
rm -rf README.md

# Configuracion de TMUX
if [[ ! -d "$TPM_DIR" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# Traer mi tmux.conf
curl -fsSL "$TMUX_CONF_URL" -o "$HOME/.tmux.conf"

# Configurar fzf (snipsets y config visual)
append_once "$BASHRC" '# Función para buscar historial con fzf e insertar el resultado'
append_once "$BASHRC" '__fzf_history__() {'
append_once "$BASHRC" '  local selected'
append_once "$BASHRC" '  selected=$(history | tac | sed '\''s/^[[:space:]]*[0-9]*[[:space:]]*//'\'' | awk '\''!seen[$0]++'\'' | fzf --height 40% --layout=reverse --border) || return'
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

# Cambiar la bash por defecto (usar tmux por defecto)
echo "→ Cambiando la shell por defecto de root a /usr/bin/tmux en /etc/passwd…"
sed -i 's|^\(root:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:\)/usr/bin/bash$|\1/usr/bin/tmux|' /etc/passwd

echo " ---------------- Instalación completada. ------------------ "
