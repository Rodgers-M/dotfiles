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

		-- a temporaty fix for an error with the eslint command that it can't find eslint
		lint.linters.eslint = {
			cmd = "eslint",
			args = {
				"--format",
				"json",
				"--stdin-filename",
				function()
					return vim.fn.expand("%:p")
				end,
			},
			cwd = function()
				return vim.fn.expand("%:p:h") -- Use the directory of the current file
			end,
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Triger linting for current file" })
	end,
}
