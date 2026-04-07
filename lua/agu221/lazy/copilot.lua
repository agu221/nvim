return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_assume_mapped = true

		vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		vim.api.nvim_set_keymap("i", "<C-Right>", 'copilot#AcceptWord()', { silent = true, expr = true })
		vim.api.nvim_set_keymap("i", "<C-Down>", 'copilot#AcceptLine()', { silent = true, expr = true })
	end
}
