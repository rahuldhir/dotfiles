alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='lsd'
alias vi='lvim'
alias view='lvim -M'
tree-git() { rg --files --hidden --ignore --glob '!.git/' "$@" | tree --fromfile -aC }
alias tree='tree-git'

bindkey -e
bindkey \^U backward-kill-line

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:${FPATH}
fi

autoload -Uz compinit; compinit
_comp_options+=(globdots)

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

eval "$(starship init zsh)"

[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
