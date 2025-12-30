return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		picker = {
			enabled = true,
			layout = { preset = "vertical" },
			matcher = { fuzzy = true, smartcase = true },
			formatters = { file = { truncate = 40 } },
		},
	},
}
