# Shell Variables
set -Ux EDITOR lvim
set -Ux GOPATH $HOME/go
set -x SHELL /usr/local/bin/fish
set -x PATH /usr/local/bin $GOPATH/bin /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin ~/.local/bin /usr/bin /bin /usr/sbin /sbin
set -g fish_key_bindings hybrid_bindings
set -g fish_escape_delay_ms 10

# Aliases
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='lsd'
alias vi='lvim'
alias view='lvim -M'
function tree
    if count $argv  > /dev/null
        set search_path $argv
    else
        set search_path .
    end
    set global_ignore_paths (cat ~/.config/git/gitignore_global | grep -v '^#' | tr [:space:] "|")
    set local_ignore_paths (git check-ignore */* 2>/dev/null | xargs basename | tr [:space:] "|")
    set ignore_paths (echo $global_ignore_paths$local_ignore_paths | sed 's/.$//' | sed 's/||/|/g')
    /usr/local/bin/tree -C -I "$ignore_paths" $search_path
end

# Key Bindings
function hybrid_bindings
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
