return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = false,
			integrations = {
				cmp = true,
				mason = true,
				telescope = true,
				treesitter = true,
			}
		})
		vim.cmd.colorscheme "catppuccin"
	end
}
