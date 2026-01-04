#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

BASHRC="$HOME/.bashrc"

# Function: Add a line if no exist
append_once() {
  local file="$1"; shift
  local snippet="$*"
  echo "$snippet" >> "$file"
}

# Update
pacman -Syu --noconfirm

#Dependencies
pacman -Syu --noconfirm tmux git curl fzf python npm go docker terraform unzip zed

#pyenv setup
git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv"
append_once "$BASHRC" 'export PATH="$HOME/.pyenv/bin:$PATH"'
append_once "$BASHRC" 'eval "$(pyenv init --path)"'
append_once "$BASHRC" 'eval "$(pyenv init -)"'

#bun instalation
curl -fsSL https://bun.sh/install | bash

#TMUX setup
TPM_DIR="$HOME/.tmux/plugins/tpm"
TMUX_CONF_URL="https://raw.githubusercontent.com/Jufedev/nvim/main/tmux/.tmux.conf"

if [[ ! -d "$TPM_DIR" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

curl -fsSL "$TMUX_CONF_URL" -o "$HOME/.tmux.conf"


#fzf history search
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


#Install Zed as root, set env to allow
append_once "$BASHRC" ''
append_once "$BASHRC" 'export ZED_ALLOW_ROOT=true'
curl -fsSL https://zed.dev/install.sh | bash

#Change default shell to tmux
sed -i 's|^\(root:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:\)/usr/bin/bash$|\1/usr/bin/tmux|' /etc/passwd

#Docker setup note
systemctl enable docker || echo "Configure docker manually in WSL"

echo " ---------------- Instalación completada. ------------------ "