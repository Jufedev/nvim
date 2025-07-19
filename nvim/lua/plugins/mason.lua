return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "html",
        "cssmodules_ls",
        "css_variables",
        "pyright",
        "csharp_ls",
        "angularls",
        "ts_ls",
        "dockerls",
        "lua_ls",
        "json_ls",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "autopep8",
        "flake8",
        "eslint_d",
      },
      automatic_installation = true,
    })
  end,
}
