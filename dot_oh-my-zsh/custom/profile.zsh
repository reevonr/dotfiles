export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/Users/reevonr/Library/Application Support/JetBrains/Toolbox/scripts"
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export EC2CLI_OS_ARCH=ec2-cli-darwin-arm64
export CHEAT_USE_FZF=true
export KUBE_EDITOR=nvim
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# eval "$(/opt/homebrew/bin/brew shellenv)"

# eval "$(op completion zsh)"; compdef _op op

# eval "$(direnv hook zsh)"

# eval "$(colima completion zsh)"

# [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
#
# # test -e /Users/reevonr/.iterm2_shell_integration.zsh && source /Users/reevonr/.iterm2_shell_integration.zsh || true

# source ~/.config/zsh/autocompletions/chezmoi.zsh

source ~/.aliases

# source <(kubectl completion zsh)

source "$HOME/.sdkman/bin/sdkman-init.sh"

SCRIPTDIR=~/Documents/projects/tml/ep-infrastructure/scripts

_default_tml_context="ep"
function tml() {
    source $SCRIPTDIR/tml.sh
    export PATH=$SCRIPTDIR:$PATH
    local env=${1:-dev}
    local context=${2:-${_default_tml_context}}
    _default_tml_context=$context
    switch_env $env $context
}

function tml_info(){
  echo "tml env context"
}

function gt() {
  # if [ $# -gt 0 ] 
  # then
    # echo "arg passed"
    # command="--tests \"${1:-}\""
  # fi   
  # echo "executing: $command"
  eval "./gradlew spotlessJava test"
}

function update_bastion() {
  z bastion-access
  tml dev ep
  tfswitch
  tfp;tfa;
  cd -
}
# qssh should accept a parameter and print it out
# should also fail when the paramter is not passed
function ec2ssh(){
  if [[ $#  -eq 0  ]]; then
    echo "argument not passed"
    return 0
  else 
    ssh sahajsoft@$(ec2-cli -t $1 | fzf | awk '{print $1}' )
  fi
  
  # ssh $1
}

function profile(){
  for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
}

function update_nvim(){
  n --headless "+Lazy! sync" +qa
}

function gbd(){
  git branch -vv | GREP_OPTIONS= grep ': gone]' | awk '{print $1}' | xargs -I {} git branch -D {}
}

function tmldcup(){
  docker rm -f zookeeper
  docker rm -f kafka
  docker rm -f postgres
  docker compose -f docker-compose-tools.yml  up -d

}
