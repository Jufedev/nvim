local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")        -- Mover areas sombreada abajo
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")        -- Mover areas sombreada arriba

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- Clear search

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Buscar archivos" })

vim.keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format()
end, { silent = true, desc = "Formatear archivo con LSP" })

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")
map("n", "<leader>qq", "<CMD>q!<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Open windows
map("n", "<leader>sv", ":split<CR>")
map("n", "<leader>sh", ":vsplit<CR>")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
