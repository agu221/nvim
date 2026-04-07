return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" },
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	config = function()
		require("CopilotChat").setup({
			system_prompt =
			"You are a Python expert. Always adhere strictly to the coding style, conventions, and patterns found in the current file and workspace. Keep answers concise.",
		})

		vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
		vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "Copilot Explain Selection" })
	end,
}
