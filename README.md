### dotfiles
A repo for my dotfiles, especially vim files

### Contents
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



