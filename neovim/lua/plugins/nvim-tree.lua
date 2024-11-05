return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- require("nvim-tree").setup({
		-- sort_by = "case_sensitive",
		-- })
		local nvim_tree = require("nvim-tree")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.cmd([[ highlight NvimTreeFolderIcon guifg=#7aa2f7 ]])
		vim.cmd([[ highlight NvimTreeFolderName guifg=#7aa2f7 ]])
		vim.cmd([[ highlight NvimTreeRootFolder guifg=#7aa2f7 ]])
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#7aa2f7 ]])
		nvim_tree.setup({
			view = {
				width = 35,
			},
			sort = {
				sorter = "case_sensitive",
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
