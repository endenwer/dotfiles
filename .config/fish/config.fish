alias e="emacsclient"
alias python="python3"

# remove greeting
set fish_greeting

fish_default_key_bindings

set -x GOPATH /users/endenwer/go

set -U fish_user_paths $HOME/bin $GOPATH/bin $HOME/.fzf/bin /usr/local/bin
