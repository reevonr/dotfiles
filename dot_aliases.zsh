cf() {
  echo $(pwd | sed 's/.*\///g')
}

alias python=python3

alias tf=terraform
alias tfp='terraform plan -out=tfplan'
alias tfa='terraform apply tfplan'
alias cat=bat

alias gl='git --no-pager log --format="%Creset%h | %cr | %Cgreen%cN%n-- %Cred%s" -n '
alias gbp='git remote prune origin'
#alias gbd="git branch -vv | GREP_OPTIONS= grep ': gone]' | awk '{print $1}' | xargs -I {} git branch -D {}"
#alias gbde=echo "git branch -vv | GREP_OPTIONS= grep ': gone]' | awk '{print $1}' | xargs -I {} git branch -D {}"

alias lg=lazygit
alias n=nvim
alias ktl=kubectl
alias ks=k9s

alias t="tmux"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"
alias tn="tmux new -s $(cf)"

alias ls="exa --icons"
alias ll="exa -l --icons"
alias la="exa -la --icons"
alias tree="exa -T --icons --git-ignore"

alias cgt='./gradlew clean test jacocoLogTestCoverage'
alias cgs='./gradlew spotlessJavaApply'

alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
