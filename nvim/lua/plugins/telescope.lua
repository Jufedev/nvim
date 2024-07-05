return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
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
          file_browser = { hijack_netrw = true,},
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set('n', '<leader>fc', builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fg", builtin.git_status, {})

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("file_browser")
    end,
  },
}