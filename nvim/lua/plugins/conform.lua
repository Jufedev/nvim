return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "isort", "black" },
					go = { "gofumpt" },
					terraform = { "terraform_fmt" },
					lua = { "stylua" },
					html = { "prettier" },
					css = { "prettier" },
					typescript = { "prettier" },
					javascript = { "prettier" },
					astro = { "prettier" },
					yaml = { "yamlfmt" },
					json = { "jq" },
					markdown = { "prettier" },
					["_"] = { "trim_whitespace" },
				},
				lsp_fallback = false,
				notify_on_error = false,
				formatters = {
					black = { prepend_args = { "--line-length", "88" } },
					prettier = {
						extra_args = { "--prose-wrap", "always" },
					},
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					require("conform").format({ async = true, lsp_fallback = false })
				end,
			})
		end,
	},
}
