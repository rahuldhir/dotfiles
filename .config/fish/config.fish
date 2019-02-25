alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -M'
alias tree='tree -C -I (cat ~/.gitignore_global (test -e .gitignore && echo .gitignore) | egrep -v "^#.*\$|^[[:space:]]*\$" | tr "\\n" "|" | sed "s/^/\'/;s/\$/\'/")'

set -Ux EDITOR nvim

set -Ux GOPATH $HOME/code/go
set PATH $PATH $GOPATH/bin

function hybrid_bindings
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings
set -g fish_escape_delay_ms 10
