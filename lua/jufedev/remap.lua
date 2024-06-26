vim.g.mapleader = " "
 
vim.keymap.set("n", "<C-b>", "<C-^>") -- Archivo anterior y siguiente (control ^)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- Limpiar busqueda

vim.keymap.set("v", "J", ":m '>+3<CR>gv=gv") -- Mover areas sombreada abajo
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Mover areas sombreada arriba

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Moverse de abajo a arriba
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Moverse de arriba a abajo
vim.keymap.set("n", "n", "nzzzv") -- Siguiente coincidencia de busqueda
vim.keymap.set("n", "N", "Nzzzv") -- Anterior coincidencia de busqueda

vim.keymap.set("x", "<leader>p", [["_dP]]) -- Pegar sin reemplazar lo que tenia anteriormente copeado
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Copear en la papelera del pc

vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format) -- Buscar archivo de config


-- navigate quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")