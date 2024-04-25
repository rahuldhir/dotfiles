alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='lsd'
alias vi='lvim' view='lvim -R'
alias tree='f(){ cd "${@:-.}" && rg --files -. --ignore -g "!.git/" | tree --fromfile -aC };f'
alias decodejwt='jq -R "split(\".\") | .[1] | @base64d | fromjson"'

setopt SHARE_HISTORY
bindkey -e \^U backward-kill-line
autoload -Uz compinit; compinit; _comp_options+=(globdots)

type kubectl &>/dev/null && source <(kubectl completion zsh)
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

type brew &>/dev/null && FPATH=$(brew --prefix)/share/zsh/site-functions:${FPATH}
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
eval "$(starship init zsh)"
