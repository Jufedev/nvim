return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",     -- Python
          "gopls",       -- Go
          "terraformls", -- Terraform
          "lua_ls",      -- Lua
          "html",        -- HTML
          "cssls",       -- CSS
          "tailwindcss", -- Tailwind
          "ts_ls",       -- TypeScript/JavaScript
          "yamlls",      -- YAML
          "jsonls",      -- JSON
          "marksman",    -- Markdown
          "astro",       -- Astro
        },
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "black", "isort", "pylint", "mypy", -- Python
          "gofumpt", "golangci-lint",         -- Go
          "tflint",                           -- Terraform
          "stylua", "luacheck",               -- Lua
          "prettier", "eslint_d",             -- HTML/CSS/TS/JS
          "yamlfmt", "yamllint",              -- YAML
          "jq", "jsonlint",                   -- JSON
          "markdownlint",                     -- Markdown
        },
      })
    end,
  },
}
