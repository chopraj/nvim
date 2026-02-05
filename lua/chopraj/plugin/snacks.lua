return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			indent = { enabled = false },
			input = { enabled = true },
			quickfile = { enabled = true },
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
					{
						section = "terminal",
						cmd = "ascii-image-converter ~/Desktop/login-hero.png -C -c",
						random = 15,
						pane = 2,
						indent = 15,
						height = 20,
					},
				},
			},
		},
		keys = {
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit Logs",
			},
			{
				"<leader>clr",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
				desc = "Pick Color Schemes",
			},

			-- Snacks Picker
			{
				"<D-p>",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files (Snacks Picker)",
			},
			{
				"<D-S-f>",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep word",
			},
			{
				"<leader>gb",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Pick and Switch Git Branches",
			},
			{
				"<D-f>",
				function()
					require("snacks").picker.lines({
						layout = "ivy",
						jump = { close = false },
					})
				end,
				mode = { "n", "v", "i" },
				desc = "Search in current buffer",
			},
		},
	},
}
