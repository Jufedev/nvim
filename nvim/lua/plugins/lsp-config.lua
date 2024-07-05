return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.css_variables.setup({ capabilities = capabilities })
      lspconfig.cssmodules_ls.setup({ capabilities = capabilities })
      lspconfig.basedpyright.setup({ capabilities = capabilities })
      lspconfig.csharp_ls.setup({ capabilities = capabilities })

      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, {})
    end,
  },
}