return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	event_handlers = {
		{
			event = "file_opened",
			handler = function(file_path)
				-- auto close
				-- vimc.cmd("Neotree close")
				-- OR
				require("neo-tree.command").execute({ action = "close" })
			end
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>rf", ":Neotree filesystem reveal right<CR>", {})
		vim.keymap.set("n", "<leader>rt", ":Neotree toggle<CR>", {})
		
	end,
}