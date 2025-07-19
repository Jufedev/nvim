return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>nr", ":Neotree current reveal right<CR>", {})
    vim.keymap.set("n", "<leader>nc", ":Neotree close<CR>", {})
  end,
}
