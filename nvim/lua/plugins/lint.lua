return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"

			local overrides = {
				golangcilint = "golangci-lint",
				tflint = "tflint",
				luacheck = "luacheck",
				eslint_d = "eslint_d",
				yamllint = "yamllint",
				jsonlint = "jsonlint",
				markdownlint = "markdownlint",
				pylint = "pylint",
				mypy = "mypy",
			}
			for key, bin in pairs(overrides) do
				if lint.linters[key] then
					lint.linters[key].cmd = mason_bin .. "/" .. bin
				end
			end

			lint.linters_by_ft = {
				python = { "pylint", "mypy" },
				go = { "golangcilint" },
				terraform = { "tflint" },
				lua = { "luacheck" },
				typescript = { "eslint_d" },
				javascript = { "eslint_d" },
				yaml = { "yamllint" },
				json = { "jsonlint" },
				markdown = { "markdownlint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
