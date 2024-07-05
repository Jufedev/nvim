## Paso a paso para la configuración

- Configurar una nerd font en la powershell, a qui una guía:

  - [Guía de powershell](https://www.youtube.com/watch?v=6SGIFVJ5Izs)

- **Mi fuente:** NERD FONT UBUNTU MONO

---

## _Instalar WSL_

```bash
wsl --install
wsl --set-default-version 2
```

---

## _Lo primero que hay que hacer al instalar Linux_

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential
```

---

## _Instalación de brew_

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/YourUserName/.bashrc
```

---

## _Dependencias necesarias_

```bash
brew install gcc
brew install git
brew install nvim
```

---

## _TMUX_

### _Instalación_

```bash
brew install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### _Configuracion_

```bash
nvim ~/.tmux.conf

tmux
```

### _Instalación de plugins_ prefix (en mi caso control s) + shift i

```bash
tmux source-file ~/.tmux.conf
```

---

## _Asignar un tema a la bash (oh my posh)_

```bash
set $TERM=xterm-256color
```

```bash
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew update && brew upgrade oh-my-posh
```

```bash
mkdir .poshthemes
nvim YOURTHEME.omp.json
```

- ### Pegar el json del tema escogido de oh my posh
- ### Añadir en el archivo .bashrc la siguiente linea

```bash
eval "$(oh-my-posh init bash --config ~/.poshthemes/YOURTHEME.omp.json)"
```

```bash
sudo apt install hstr
hstr --show-configuration >> ~/.bashrc
```

---

## _En caso de que hstr y el tema de oh my posh no funcionen_

```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh init bash --config ~/.poshthemes/YOURTHEME.omp.json)"

alias hh=hstr
export HSTR*CONFIG=hicolor,hide-help
shopt -s histappend
export HISTCONTROL=ignorespace
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
if [[$- =~ .\_i.*]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
```

---

## _Cambiar terminar por defecto al abrir wsl_

```bash
sudo vim /etc/passwd
```

_Añadir la siguiente ruta para reemplazar la terminal por defecto con TMUX_

- /usr/bin/tmux

---

## _Clonar mi configuración de nvim_

```bash
git clone https://github.com/Jufedev/nvim ~/.config/nvim
```

---

## _Dependencias para desarrollo con js_

```bash
brew install node
brew install npm
```

## _Dependencias para probar apis por consola_

```bash
brew install httpie
brew upgrade httpie
```
