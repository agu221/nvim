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
				ensure_installed = { "lua_ls", "pyright", "clangd" },
				automatic_enable = true,
			})

			local capabilities = require('blink.cmp').get_lsp_capabilities()

			local function enable_lsp(server_name, config)
				config = config or {}
				config.capabilities = capabilities

				vim.lsp.config(server_name, config)
				vim.lsp.enable(server_name)
			end

			enable_lsp('lua_ls')
			enable_lsp('pyright')
			enable_lsp('clangd', {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
					"--header-insertion=iwyu",
					"--fallback-style=llvm",
				},
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
				root_markers = {
					"compile_commands.json",
					"compile_flags.txt",
					".clangd",
					"CMakeLists.txt",
					"Makefile",
					".git",
				},
				init_options = {
					fallbackFlags = {
						"-std=c17",
						"-Iinclude",
						"-Wall",
						"-Wextra",
						"-Wpedantic",
					},
				},
			})
		end,
	}
}
