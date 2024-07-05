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
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.csharpier,
      },
    })

    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
  end,
}