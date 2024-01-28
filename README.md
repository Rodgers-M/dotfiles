### dotfiles

A repo for my dotfiles, especially vim files

### Contents

TODO: document how to setup neovim with Lazyvim

the repo was initaily meant for hosting vim files.
I however switched to using neovim and hence the neovim folder.
The .vim folder has a file containing plugins i use with vim.
The neovim folder is all you need if you will be working with neovim.

### Getting started.

After cloning the repo, you will need to create a symlink to point to the
location

## example command on osx

# neovim

`ln -s /path-to-cloned-repo/dotfiles/neovim/init.vim  /Users/username/.config/nvim/init.vim`

# vim

`ln -s /path-to-cloned-repo/dotfiles/.vimrc /Users/username/.vimrc`

and same applies for the plugins.vim and any other file you might want to
symlink

`ln -s /path-to-cloned-repo/dotfiles/neovim/plugins.vim  /Users/username/.config/nvim/plugins.vim`

this should be good to get you started

# Useful links

[troubleshoot/debug key bindings/mappings](https://vi.stackexchange.com/questions/7722/how-to-debug-a-mapping) : sometimes mappings my not work as expected.
[video showing how to use emmet for html snippets](https://youtu.be/Sc30cyEH5oo?t=405)
do `:help map-which-keys ` for vim's suggestions on what keys to map.

# see link below to setup nerd fonts on the terminal

[installing nerd fonts](https://webinstall.dev/nerdfont/)

[showing diagnostic window on hover](https://neovim.discourse.group/t/how-to-show-diagnostics-on-hover/3830)

# Tip

after installing dependencies also install the respective coc-server for your perffered language. e.g for js/ts install [coc-tsserver](https://github.com/neoclide/coc-tsserver)

# The coc-plugins i use for my development.

- coc-tsserver
- coc-prettier
