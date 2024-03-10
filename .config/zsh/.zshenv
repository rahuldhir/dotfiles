export ZDOTDIR=~/.config/zsh

export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

export HISTFILE=$XDG_STATE_HOME/zsh/history
export LESSHISTFILE=$XDG_STATE_HOME/less/history
export EDITOR=lvim
export GOPATH=~/go
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

test -e ~/repos/github.com/TOKEN && export GITHUB_TOKEN=$(cat ~/repos/github.com/TOKEN)
test -e ~/repos/github.com/TOKEN && export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/repos/github.com/TOKEN)

path=(~/.local/bin $path)
path=(/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin $path)
path=($GOPATH/bin $path)
path=(/usr/local/bin $path)
path=(/opt/homebrew/bin $path)
export PATH
