zle -N ts
bindkey '\es' 'ts'

zle -N tc
bindkey '\ec' tc

function gt() {
  eval "./gradlew spotlessJava test"
}

function profile(){
  for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
}

function update(){
  # brew upgrade
  # omz update
  # nvim --headless "+Lazy! sync" +qa
  fzf --zsh > "$HOME/.completion/.fzf.sh"
  kubectl completion zsh > "$HOME/.completion/.kubectl.sh"
  k9s completion zsh  > "$HOME/.completion/.k9s.sh"
  helm completion zsh > "$HOME/.completion/.helm.sh"
  zoxide init zsh > $HOME/."completion/.zoxide.sh"
  docker completion zsh > "$HOME/.completion/.docker.sh"
}

function gbd(){
  git branch -vv | GREP_OPTIONS= grep ': gone]' | awk '{print $1}' | xargs -I {} git branch -D {}
}



ts(){
  tmp=$(tmux list-sessions | awk '{print $1}' | sed 's/://g' | fzf-tmux -p --print-query --header Sessions)
  if [ -z "$tmp" ]; then
    return 0  # Exit successfully if the variable is empty
  fi
  ses=$(trim $tmp)
  if [ -z "$ses" ]; then
    return 0  # Exit successfully if the variable is empty
  fi
  tmux new -d -s $ses >/dev/null "cd $HOME;$SHELL" 2>&1 || true 
  tmux switch-client -t $ses
}

tc(){
  dir=$(zoxide query -l -s | awk '$1 > 1  {print $2}' | fzf-tmux -p ) 
  if [ -z "$dir" ]; then
    return 0  # Exit successfully if the variable is empty
  fi
  ses=$(echo $dir | sed 's/.*\///g')   
  tmux new -d -s $ses "cd $dir;$SHELL" >/dev/null 2>&1 || true 
  tmux switch-client -t $ses

}

awsl(){
  prof=$(aws-vault list  | awk '{print $1}' | fzf-tmux -p60%,50% --header-lines 2 --border --border-label=AWS-Vault --header-first) 
  echo $prof
}
