return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    'nanotee/zoxide.vim',
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
      vim.keymap.set('n', '<leader>fc', builtin.live_grep, {})

      require("telescope").load_extension("ui-select")
      vim.g.zoxide_use_select = true
    end,
  },
}