SCRIPTDIR=~/Documents/projects/tml/ep-infrastructure/scripts
_default_tml_context="ep"
_default_tml_env="dev"

zle -N tmls
bindkey '^T' 'tmls'

zle -N tmlaws
bindkey '^A' 'tmlaws'

function tml() {
    source $SCRIPTDIR/tml.sh
    export PATH=$SCRIPTDIR:$PATH
    local env=${1:-dev}
    local context=${2:-${_default_tml_context}}
    _default_tml_context=$context
    _default_tml_env=$env
    switch_env $env $context
}

function update_bastion() {
  z bastion-access
  tml dev ep
  tfswitch
  terraform apply -auto-approve
  cd -
}

function tmlssh(){
  local tag=${1:-""}
  ec2Server=$(ec2-cli -t $tag,$_default_tml_context,$_default_tml_env | sort -k2 | fzf-tmux -p80%,60% \
  --color=label:italic:bold --border-label=' TML ' \
  --header ${tag:-All} --header-first
  )
  if [ -z "$ec2Server" ]; then
    return 0  # Exit successfully if the variable is empty
  fi
  echo $ec2Server
  pick=$(echo $ec2Server | awk '{print $1}' )
  TERM=xterm-256color ssh sahajsoft@$pick
}

function tmldcup(){
  docker rm -f zookeeper
  docker rm -f kafka
  docker rm -f postgres
  docker compose -f docker-compose-tools.yml  up -d

}

trim() {
    if [ -z "$1" ]; then
        return 0
    fi
    echo "$1" | sed -re 's/^[[:blank:]]+|[[:blank:]]+$//g' -e 's/[[:blank:]]+/ /g' | tr -d '\n'  
}

tmlenv(){
  echo "dev ep"
  echo "pre-prod ep"
  echo "prod ep"
  echo "dev mes4"
  echo "prod mes4"
  echo "dev mes4-ev"
  echo "pre-prod mes4-ev"
  echo "prod mes4-ev" 
}

tmls(){
  read env bu <<< $(echo "$(tmlenv)" | fzf-tmux -p \
  --color=label:italic:bold --border-label=' TML ' \
  --header Environments --header-first)
  if [[ -z "$env" ]]; then
    return 0
  fi
  echo "setting up tml environment $env $bu"
  tml $env $bu

 }

tmlaws(){
  read env bu <<< $(echo "$(tmlenv)" | fzf-tmux -p \
  --color=label:italic:bold --border-label=' TML ' \
  --header AWS-Accounts --header-first)
  if [[ -z "$env" ]]; then
    return 0
  fi

  aws-vault login "tml-$bu-$env"
}

function coverage(){
  if [ "$AWS_PROFILE" != "tml-mes4-dev" ]; then
    tml dev mes4
  fi
  
  repo=$(basename `git rev-parse --show-toplevel`)
  cov=$(aws s3 cp s3://tml-avantgarde-code-coverage/$repo/coverage -)
  echo "$repo  $cov"
}
