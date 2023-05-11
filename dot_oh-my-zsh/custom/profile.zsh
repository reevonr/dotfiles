export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/Users/reevonr/Library/Application Support/JetBrains/Toolbox/scripts"
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"


eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(op completion zsh)"; compdef _op op

eval "$(starship init zsh)"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

source ~/.iterm2_shell_integration.zsh

source ~/.config/zsh/autocompletions/chezmoi.zsh

source ~/.aliases

function gcl {
	git clone ssh://git@github.com/$1/$2.git;
}
