return {
	--[[	"luk400/vim-jukit",
	event = "VeryLazy",
	config = function()
		vim.g.jukit_terminal = "tmux"
		vim.g.jukit_shell_cmd = "ipython3"
		vim.g.jukit_inline_plotting = 1
		vim.g.jukit_hist_use_ueberzug = 0 -- or 1 if ueberzug installed
		vim.g.jukit_highlight_markers = 1
		vim.g.jukit_max_size = 200
		vim.g.jukit_layout = {
			split = 'horizontal',
			p1 = 0.4,
			val = {
				'file_content',
				{
					split = 'vertical',
					p1 = 0.4,
					val = { 'output', 'output_history' }
				}
			}
		}
		local map = vim.keymap.set
		local opts = { remap = false, silent = true }

		map("n", "<leader> ", "<leader> ", opts)
		vim.keymap.set("n", "<leader>np", ":JukitConvert<CR>", { desc = "Convert .ipynb to .py", silent = true })
		map("n", "<leader>os", ":JukitOut<CR>", opts)
		map("n", "<leader>hs", ":JukitHistShow<CR>", opts)
	end,]]
}
