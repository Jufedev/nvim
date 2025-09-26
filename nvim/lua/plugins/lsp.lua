return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- 1) Capacidades y on_attach
		local caps = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		local function on_attach(_, bufnr)
			local km = vim.keymap.set
			km("n", "<leader>H", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
			km("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to Definition" })
			km("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: References" })
			km("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: Code Action" })
		end

		local servers = {
			astro = {},
			html = {},
			cssmodules_ls = {},
			css_variables = {},
			pyright = {},
			csharp_ls = {},
			angularls = {},
			ts_ls = {},
			dockerls = {},
			jsonls = {},
			lua_ls = {},
			terraformls = {
				init_options = {
					terraform = { ignoreSingleFileWarning = true },
				},
			},
		}

		for name, extra in pairs(servers) do
			local opts = vim.tbl_deep_extend("force", {
				on_attach = on_attach,
				capabilities = caps,
			}, extra)
			vim.lsp.config(name, opts)
			vim.lsp.enable(name)
		end
	end,
}