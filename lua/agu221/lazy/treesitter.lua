return {{
 		"nvim-treesitter/nvim-treesitter",
 		config = function()
 			require('nvim-treesitter.configs').setup({
 				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "go", "typescript", "tsx", "javascript", "json" },
 				auto_install = true,

 				highlight = {
 					enable = true,
 				},
 				indent = { enable = true },
 				incremental_selection = {
 					enable = true,
 					keymaps = {
 						init_selection = "<Leader>ss",
 						node_incremental = "<Leader>ni",
 						scope_incremental = "<Leader>si",
 						node_decremental = "<Leader>nd",
 					},
 				},
 				textobjects = {
 					select = {
 						enable = true,

 						-- Automatically jump forward to textobj, similar to targets.vim
 						lookahead = true,

 						keymaps = {
 							["af"] = "@function.outer",
 							["if"] = "@function.inner",
 							["ac"] = "@class.outer",
 							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
 							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
 						},
 						selection_modes = {
 							['@parameter.outer'] = 'v', -- charwise
 							['@function.outer'] = 'v', -- linewise
 							['@class.outer'] = '<c-v>', -- blockwise
 						},
 						include_surrounding_whitespace = true,
 					},
 				},
 			})
 		end,
 	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"neovim/nvim-lspconfig",
	}}
