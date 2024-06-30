return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                                  ]],
      [[                                                                                  ]],
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
      [[                                                                                  ]],
      [[                                                                                  ]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞    Find File", ":Telescope find_files <CR>"),
      dashboard.button("g", "    New File", "<cmd>ene <CR>"),
      dashboard.button("r", "󱋡    Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("c", "    Config", ":e D:\\neovim\\nvim\\init.lua <CR>"),
      dashboard.button("q", "󰩈    Quit", ":qa <CR>"),
    }
    dashboard.section.buttons.opts = {
      spacing = 1,
      position = "center"
    }
    local function footer()
      return "▄▀█ █▀ █▀█   █▄ █ █▀▀ ▀█▀   ▄█▄   ▄▀█ █▄ █ █▀▀ █ █ █   ▄▀█ █▀█\n█▀█ ▄█ █▀▀ ▄ █ ▀█ ██▄  █     ▀    █▀█ █ ▀█ █▄█ █▄█ █▄▄ █▀█ █▀▄"
    end
    dashboard.section.footer.val = footer()

    alpha.setup(dashboard.opts)
  end,
}