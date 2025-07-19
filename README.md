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

### _Instalación_ 

- En mi caso se instalara Tmux, Python, Npm y Fzf.

- Se debe copear el script de instalacion (Compatible unicamente con arch Linux) y ejecutralo.

- Una vez terminada su ejecucion se debe insertar el siguiente comando:

```bash
source ~/.bashrc
```

- Ya dentro de TMUX se debe instalar los pluggins de este, para ello hay que presionar prefix (en mi caso control s) + shift i

- Por ultimo ejecutamos nvim y con :Mason podemos ver el progreso de los lenguajes (Linters, formatters, etc)

---

## _Dependencias para probar apis por consola_

- httpie
- 
```bash
export PATH="$HOME/.local/node-20/bin:$HOME/.bun/bin:$PATH"
```
