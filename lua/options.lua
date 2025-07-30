vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", ":Ex<CR>")
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.diagnostic.config({
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
		update_in_insert = true,
	},
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

