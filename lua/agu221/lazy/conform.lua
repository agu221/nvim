return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black", "docformatter" },
				typescript = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 1500,
				lsp_format = "fallback",
			},
			formatters = {
				docformatter = {
					prepend_args = { "--wrap-summaries", "88", "--wrap-descriptions", "88" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ lsp_fallback = true, async = false })
		end, { desc = "Format file" })
	end
}
