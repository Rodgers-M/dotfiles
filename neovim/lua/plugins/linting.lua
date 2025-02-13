return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			svelte = { "eslint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				-- setting this back to root directory because of an error happening
				-- on the BufWritePost event  autocomands,  ( autocomands for '*', no such file or directory)
				local git_root = vim.fn.finddir(".git", ".;")
				if git_root ~= "" then
					vim.fn.chdir(vim.fn.fnamemodify(git_root, ":h")) -- Set project root
				end
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Triger linting for current file" })
	end,
}
