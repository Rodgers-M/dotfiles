vim.cmd [[
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
]]
