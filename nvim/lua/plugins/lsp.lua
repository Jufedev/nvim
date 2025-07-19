return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local caps = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local function on_attach(_, bufnr)
      local km = vim.keymap.set
      km("n", "<leader>H", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
      km("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to Definition" })
      km("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: References" })
      km("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: Code Action" })
    end

    local servers = {
      "html",
      "cssmodules_ls",
      "css_variables",
      "pyright",
      "csharp_ls",
      "angularls",
      "ts_ls",
      "dockerls",
      "jsonls",
      "lua_ls",
    }

    for _, name in ipairs(servers) do
      lspconfig[name].setup({
        on_attach = on_attach,
        capabilities = caps,
      })
    end
  end,
}
