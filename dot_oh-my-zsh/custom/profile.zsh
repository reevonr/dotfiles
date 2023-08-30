export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/Users/reevonr/Library/Application Support/JetBrains/Toolbox/scripts"
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
export EC2CLI_OS_ARCH=ec2-cli-darwin-arm64
export CHEAT_USE_FZF=true

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(op completion zsh)"; compdef _op op

eval "$(starship init zsh)"

eval "$(direnv hook zsh)"

eval "$(colima completion zsh)"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

test -e /Users/reevonr/.iterm2_shell_integration.zsh && source /Users/reevonr/.iterm2_shell_integration.zsh || true

source ~/.config/zsh/autocompletions/chezmoi.zsh

source ~/.aliases

source <(kubectl completion zsh)

source "$HOME/.sdkman/bin/sdkman-init.sh"

SCRIPTDIR=~/Documents/projects/tml/ep-infrastructure/scripts

_default_tml_context="ep"
tml() {
    source $SCRIPTDIR/tml.sh
    export PATH=$SCRIPTDIR:$PATH
    local env=${1:-dev}
    local context=${2:-${_default_tml_context}}
    _default_tml_context=$context
    switch_env $env $context
}

tml_info(){
  echo "tml env context"
}
