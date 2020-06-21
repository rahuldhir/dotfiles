# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias em='emacs -nw'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -M'
alias python='python3'
alias pip='pip3'

# Shell Variables
set -Ux EDITOR nvim
set -Ux GOPATH $HOME/go
set -x PATH /usr/local/bin $GOPATH/bin $PATH
set -g fish_key_bindings hybrid_bindings
set -g fish_escape_delay_ms 10
set -x BUILD_ENV_PREFER_LOCAL true

# Functions
function tree
    if count $argv  > /dev/null
        set search_path $argv
    else
        set search_path .
    end
    set global_ignore_paths (cat ~/.gitignore_global | grep -v '^#' | tr [:space:] "|")
    set local_ignore_paths (git check-ignore */* | tr [:space:] "|")
    echo $global_ignore_paths
    echo $local_ignore_paths
    /usr/local/bin/tree -C -I '$global_ignore_paths$local_ignore_paths' $search_path
end

function hybrid_bindings
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
