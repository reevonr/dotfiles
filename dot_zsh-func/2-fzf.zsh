export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --border --margin=1 --padding=1 --color=label:italic"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--pointer '▶' \
--marker '⇒' \
--prompt ':: '"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

export FZF_CTRL_R_OPTS="--border --border-label=History"

export FZF_CTRL_T_COMMAND=''

export FZF_ALT_C_COMMAND=""

_fzf_compgen_path() {
    rg --files --glob "!.git" . "$1"
}

_fzf_compgen_dir() {
   fd --type d --hidden --follow --exclude ".git" . "$1"
}
