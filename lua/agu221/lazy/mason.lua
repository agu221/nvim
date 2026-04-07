return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				},
			}
		}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" },
				automatic_enable = true,
			})

			local capabilities = require('blink.cmp').get_lsp_capabilities()

			vim.lsp.config('lua_ls', { capabilities = capabilities })
			vim.lsp.enable('lua_ls')

			vim.lsp.config('pyright', { capabilities = capabilities })
			vim.lsp.enable('pyright')
		end,
	}
}
