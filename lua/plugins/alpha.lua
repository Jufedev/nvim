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
      -- dashboard.button("g", "    New File", ":e ~/documents/gitgud <CR>"),
      -- dashboard.button("p", "󰥨    Find Folder", ":lua require('telescope').extensions.projects.projects()<CR>"),
      -- dashboard.button("g", "    New Folder", ":e ~/documents/gitgud <CR>"),
      dashboard.button("r", "󱋡    Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("c", "    Config", ":e D:\\neovim\\nvim\\init.lua <CR>"),
      dashboard.button("q", "󰩈    Quit", ":qa <CR>"),
    }
    dashboard.section.buttons.opts = {
      spacing = 1,
      position = "center"
    }
    local function footer()
      return "こんばんは\n  ニール"
    end
    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end,
}