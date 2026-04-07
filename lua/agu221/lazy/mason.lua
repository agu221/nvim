return {{
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
 				ensure_installed = { "lua_ls" },
 				automatic_enable = true,
 			})
 		end,
 	}}
