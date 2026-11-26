return {
	"milanglacier/minuet-ai.nvim",
	lazy = false,
	config = function()
		require("minuet").setup({
			provider = "openai_fim_compatible",
			throttle = 2000,
			debounce = 600,
			provider_options = {
				openai_fim_compatible = {
					api_key = "TERM",
					name = "Ollama",
					end_point = "http://localhost:11434/v1/completions",
					model = "qwen2.5-coder:7b",
					stream = true,
					optional = {
						max_tokens = 256,
						top_p = 0.9,
					},
				},
			},
			virtualtext = {
				auto_trigger_ft = { "*" },
				keymap = {
					accept_n_lines = "<A-z>",
					dismiss = "<A-e>",
				},
			},
		})

		local action = require("minuet.virtualtext").action

		vim.keymap.set("i", "<Down>", function()
			if action.is_visible() then
				action.accept()
				return ""
			end
			return "<Down>"
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<Left>", function()
			if action.is_visible() then
				action.accept_line()
				return ""
			end
			return "<Left>"
		end, { expr = true, silent = true })
	end,
	keys = {
		{
			"<A-y>",
			function()
				require("minuet.virtualtext").action.next()
			end,
			mode = "i",
			desc = "Minuet: trigger/next completion",
		},
	},
}
