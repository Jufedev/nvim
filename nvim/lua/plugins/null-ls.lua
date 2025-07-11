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
            filetypes = { "html","css","json","yaml","markdown","javascript","typescript" },
          }),
          null_ls.builtins.formatting.stylua,

          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.diagnostics.eslint_d,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.keymap.set(
              "n",
              "<leader>cf",
              vim.lsp.buf.format,
              { buffer = bufnr, desc = "Formatear archivo" }
            )
          end
        end,
      })
    end,
  },
}
