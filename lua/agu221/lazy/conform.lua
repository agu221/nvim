return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				lua = { "stylua" },
				objc = { "clang_format" },
				objcpp = { "clang_format" },
				python = { "isort", "black" },
				typescript = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 1500,
				lsp_format = "fallback",
			},
			formatters = {
				black = {
					prepend_args = { "--skip-string-normalization" },
				},
				clang_format = {
					prepend_args = { "--fallback-style=LLVM" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ lsp_format = "fallback", async = false })
		end, { desc = "Format file" })
	end
}
