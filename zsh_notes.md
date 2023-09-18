## Plugins
    zsh-syntax-highlighting, z , git , zsh_autosuggestions  
## Alises
alias tree = "find . -type d \( -name .git -o -name zsh-syntax-highlighting -o -name node_modules \) -prune -o -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
