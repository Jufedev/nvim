return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local servers = {
				"pyright",
				"gopls",
				"terraformls",
				"lua_ls",
				"html",
				"cssls",
				"tailwindcss",
				"ts_ls",
				"yamlls",
				"jsonls",
				"marksman",
				"astro",
			}

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				settings = {
					typescript = {
						preferences = {
							importModuleSpecifier = "relative",
						},
					},
				},
			})

			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						gofumpt = true,
					},
				},
			})

			vim.lsp.enable(servers)
		end,
	},
}
