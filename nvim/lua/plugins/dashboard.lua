return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard")
      local db = require("dashboard")
      db.setup({
        theme = "doom",
        config = {
          header = {
            [[                                                                                  ]],
            [[       ▄█ ███    █▄     ▄████████    ▄████████ ████████▄     ▄████████  ▄█    █▄  ]],
            [[      ███ ███    ███   ███    ███   ███    ███ ███   ▀███   ███    ███ ███    ███ ]],
            [[      ███ ███    ███   ███    █▀    ███    █▀  ███    ███   ███    █▀  ███    ███ ]],
            [[      ███ ███    ███  ▄███▄▄▄      ▄███▄▄▄     ███    ███  ▄███▄▄▄     ███    ███ ]],
            [[      ███ ███    ███ ▀▀███▀▀▀     ▀▀███▀▀▀     ███    ███ ▀▀███▀▀▀     ███    ███ ]],
            [[      ███ ███    ███   ███          ███    █▄  ███    ███   ███    █▄  ███    ███ ]],
            [[      ███ ███    ███   ███          ███    ███ ███   ▄███   ███    ███ ███    ███ ]],
            [[  █▄ ▄███ ████████▀    ███          ██████████ ████████▀    ██████████  ▀██████▀  ]],
            [[  ▀▀▀▀▀▀                                                                          ]],
            [[                                                                                  ]],
          },
          center = {
            { icon = "󰈞  ", desc = "Find File",    key = "f", action = "Telescope find_files" },
            { icon = "  ", desc = "New File",     key = "g", action = "ene" },
            { icon = "󱋡  ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
            { icon = "  ", desc = "Config",       key = "c", action = "e ~/.config/nvim/init.lua" },
            { icon = "󰩈  ", desc = "Quit",         key = "q", action = "qa" },
          },
          footer = { "ユフェデフ" },
          vertical_center = true,
        },
      })
  end,
  dependencies = { {"nvim-tree/nvim-web-devicons"}}
}
