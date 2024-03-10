alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='lsd'
alias vi='lvim'
alias view='lvim -M'
alias tree='rg --files | tree --fromfile'

bindkey -e
bindkey \^U backward-kill-line

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:${FPATH}
  FPATH=$(brew --prefix)/share/zsh-completions:${FPATH}

  autoload -Uz compinit
  compinit

  source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
fi

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

eval "$(starship init zsh)"
