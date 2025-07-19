return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.formatting.prettier.with({
            filetypes = {
              "html",
              "css",
              "json",
              "jsonc",
              "yaml",
              "markdown",
              "javascript",
              "typescript"
            },
          }),
          null_ls.builtins.formatting.stylua.with({
            filetypes = {
              "lua"
            },
          }),

          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.diagnostics.eslint_d,
        },
      })
    end,
  },
}
