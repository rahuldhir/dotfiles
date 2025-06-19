alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='lsd'
alias vi='lvim' view='lvim -R'
alias tree='f(){ cd "${@:-.}" && rg --files -. --ignore -g "!.git/" | tree --fromfile -aC && cd -};f'
alias decodejwt='jq -R "split(\".\") | .[1] | @base64d | fromjson"'

bindkey -e \^U backward-kill-line
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit; compinit; _comp_options+=(globdots)

setopt APPEND_HISTORY
setopt SHARE_HISTORY
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=256000
export SAVEHIST=256000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

type kubectl &>/dev/null && source <(kubectl completion zsh)
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

type brew &>/dev/null && FPATH=$(brew --prefix)/share/zsh/site-functions:${FPATH}
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
eval "$(starship init zsh)"
