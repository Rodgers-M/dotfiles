return {

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- status line
	"itchyny/lightline.vim",

	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	-- Highlight yanked text
	"machakann/vim-highlightedyank",

	-- preview css colors
	"ap/vim-css-color",
	-- html react plugins
	"mattn/emmet-vim",
	"tpope/vim-surround",

	-- rust plugin
	"rust-lang/rust.vim",

	-- svelte
	"leafOfTree/vim-svelte-plugin",

	-- prisma
	"prisma/vim-prisma",

	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- auto save
	{
		"pocco81/auto-save.nvim",
		opts = {},
	},

	--auto close tags
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		opts = {},
	},
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"<leader>hp",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "Preview git hunk" }
				)

				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set({ "n", "v" }, "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
				vim.keymap.set({ "n", "v" }, "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
			end,
		},
	},

	{
		"navarasu/onedark.nvim",
		priority = 1000,
		opts = {
			style = "dark", -- optional: choose your preferred style (e.g., dark, deep, warm, cool)
		},
		config = function(_, opts)
			require("onedark").setup(opts)
			require("onedark").load()
		end,
	},

	-- {
	-- -- Add indentation guides even on blank lines
	-- "lukas-reineke/indent-blankline.nvim",
	-- -- Enable `lukas-reineke/indent-blankline.nvim`
	-- -- See `:help indent_blankline.txt`
	-- config = function()
	-- require("ibl").setup({
	-- indent = {
	-- char = "┊",
	-- },
	-- show_trailing_blankline_indent = false,
	-- })
	-- end,
	-- },

	{ "scrooloose/nerdcommenter" },

	-- auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- javascript development
	"maxmellon/vim-jsx-pretty",
	"peitalin/vim-jsx-typescript",

	--splits / windows management
	"wesQ3/vim-windowswap",
	{ "szw/vim-maximizer", keys = { { "<leader>mx", "<cmd>MaximizerToggle<CR>" } } },
}
