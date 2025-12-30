return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"python",
					"go",
					"hcl",
					"lua",
					"html",
					"css",
					"typescript",
					"javascript",
					"yaml",
					"json",
					"markdown",
					"markdown_inline",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
