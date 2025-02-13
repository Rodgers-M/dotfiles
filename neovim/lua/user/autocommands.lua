vim.cmd([[
    "automatically toggle relative numbers on different situeations
    "when in insert mode or buffer loses focus, turn off relative number
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    "disable the red highlight on JSON comments
    autocmd FileType json syntax match Comment +\/\/.\+$+

    "number of spaces when edditing specific files 
    autocmd Filetype html setlocal ts=2 sw=2 expandtab
    autocmd Filetype python setlocal ts=4 sw=4 expandtab
    autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
    autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
    autocmd Filetype php setlocal ts=2 sw=2 expandtab

    "jump back to last position when reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
    endif
]])

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(winid).zindex then
			return
		end
	end

	-- this is for builtin lsp
	vim.diagnostic.open_float({
		bufnr = 0,
		scope = "cursor",
		focusable = false,
		close_events = {
			"CursorMoved",
			"CursorMovedI",
			"BufHidden",
			"InsertCharPre",
			"WinLeave",
		},
	})
end
-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	command = "lua OpenDiagnosticIfNoFloat()",
	group = "lsp_diagnostics_hold",
})
