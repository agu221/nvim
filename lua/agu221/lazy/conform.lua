return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				typescript = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 1500,
				lsp_format = "fallback",
			}
		})
	end
}
