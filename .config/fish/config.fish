alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -M'
alias python='python3'
alias pip='pip3'

function tree
    if count $argv  > /dev/null
        set search_path $argv
    else
        set search_path .
    end
    set ignore_paths echo -e (cat ~/.gitignore_global | grep -v '^#') && git check-ignore */* | tr " " "|"
    /usr/local/bin/tree -C -I '$ignore_paths' $search_path
end

set -Ux EDITOR nvim

set -Ux GOPATH $HOME/code/go
if type -q rbenv
  status --is-interactive; and . (rbenv init -|psub)
end

set -x PATH $PATH $GOPATH/bin/

function hybrid_bindings
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings
set -g fish_escape_delay_ms 10
