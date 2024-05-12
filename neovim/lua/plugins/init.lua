return {

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- status line
	"itchyny/lightline.vim",

	-- file explorer
	"preservim/nerdtree",

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

	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- auto save
	{
		"pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup()
		end,
	},

	--auto close tags
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},

	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		opts = {},
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
			-- Theme inspired by Atom
			"navarasu/onedark.nvim",
			priority = 1000,
			config = function()
				vim.cmd.colorscheme("onedark")
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

		-- "gc" to comment visual regions/lines
		-- { 'numToStr/Comment.nvim', opts = {} },
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
	},
}
