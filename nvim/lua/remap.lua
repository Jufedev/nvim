local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("v", "J", ":m '>+1<CR>gv=gv") -- Mover areas sombreada abajo
map("v", "K", ":m '<-2<CR>gv=gv") -- Mover areas sombreada arriba

map("n", "<leader>h", ":nohlsearch<CR>") -- Clear search

map("n", "<leader>cdl", function()
	vim.diagnostic.setloclist()
end)

map("n", "<leader>cd", function()
	vim.diagnostic.open_float()
end)

map("n", "<leader>ff", function()
	Snacks.picker.files()
end)

map("n", "<leader>cf", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	for _, client in ipairs(clients) do
		if client.server_capabilities and client.server_capabilities.documentFormattingProvider then
			vim.lsp.buf.format({ async = true })
			return
		end
	end
	require("conform").format({ async = true })
end)

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
