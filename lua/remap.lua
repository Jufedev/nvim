local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

vim.keymap.set("v", "J", ":m '>+3<CR>gv=gv") -- Mover areas sombreada abajo
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Mover areas sombreada arriba


vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>tb", ":tab split<CR>")
map("n", "<leader>tq", ":tab close<CR>")
map("n", "<leader>ñ", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Terminal
map("n", "<leader>ty", ":below terminal<CR>")
map("n", "<leader>tr", ":vert terminal<CR>")
map("n", "<leader>t", ":tab terminal<CR>")

-- CMABIAR GTESTOR DE ARCHIVOS PORDEFECTO

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Buffers
map("n", "bq", ":BufferLineCloseOthers<CR>")
map("n", "bl", ":BufferLineCycleNext<CR>")
map("n", "bh", ":BufferLineCyclePrev<CR>")
map("n", "bn", ":BufferLineGoToBuffer ")
map("n", "br", ":BufferLineTabRename ")

