local c_filetypes = { "c", "cpp", "objc", "objcpp" }

local function run_make(target)
	vim.cmd("write")

	if target == nil or target == "" then
		vim.cmd("make")
	else
		vim.cmd("make " .. target)
	end

	vim.cmd("cwindow")
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = c_filetypes,
	callback = function(args)
		vim.bo[args.buf].tabstop = 4
		vim.bo[args.buf].shiftwidth = 4
		vim.bo[args.buf].softtabstop = 4
		vim.bo[args.buf].expandtab = true
		vim.bo[args.buf].makeprg = "make"

		local keymap_options = function(description)
			return { buffer = args.buf, desc = description }
		end

		vim.keymap.set("n", "<leader>cb", function()
			run_make("")
		end, keymap_options("Build C project"))

		vim.keymap.set("n", "<leader>ct", function()
			run_make("test")
		end, keymap_options("Test C project"))

		vim.keymap.set("n", "<leader>cr", function()
			run_make("run")
		end, keymap_options("Run C project"))

		vim.keymap.set("n", "<leader>cc", function()
			run_make("clean")
		end, keymap_options("Clean C project"))
	end,
})
