return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<right>",
					accept_word = "<down>",
					accept_line = "<left>",
					next = "<c-9>",
					dismiss = "<c-8>",
				},
			},
			filetypes = {
				markdown = true,
			},
		})
	end,
}
