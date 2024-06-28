return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "html", "css", "json", "yaml", "markdown", "javascript", "javascriptreact", "typescript", "typescriptreact", },
        }),
        require("none-ls.diagnostics.eslint"),
        null_ls.builtins.formatting.pyink,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.csharpier,
      },
    })

    vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
  end,
}