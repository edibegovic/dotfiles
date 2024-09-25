return {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		-- map c-f to find_files and leader-leader to commands
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			require("telescope").load_extension("fzf")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
				extensions = {
					smart_open = {
						match_algorithm = "fzf",
					},
				},
			})

			vim.keymap.set("n", "<c-f>", "<cmd>Telescope find_files<cr>")
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
			vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
			vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope<cr>")
		end,
	},
	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			-- Only required if using match_algorithm fzf
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
}
