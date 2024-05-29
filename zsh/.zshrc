# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="awesomepanda"
#
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    poetry
    zsh-syntax-highlighting
    fzf-zsh-plugin
)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
else
 export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases
bindkey '^o' autosuggest-execute

# Git aliases
alias gcwl="git rev-list HEAD ^master | wc -l"
alias gcam="git commit --all --message"
alias gc="git commit --verbose"
alias gcan!="git commit --verbose --all --no-edit --amend"
alias gst="git status"
alias gsta="git stash save"
alias gstaa="git stash apply"
alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gaa="git add --all"
alias gf="git fetch"
alias gl="git pull"
alias gp="git push"

alias ls="colorls"
alias ll="colorls -l"
alias d="docker"
alias dc="docker-compose"
alias poe="poetry"
alias nv="nvim"
alias python3="/opt/homebrew/Cellar/python@3.11/3.11.4_1/bin/python3"
alias gcwl="git rev-list HEAD ^master | wc -l"
#alias poenv="source $(poetry env info --path)/bin/activate"
alias resconsul="brew services restart ati-consul"

export ENVIRONMENT="dev"

export HOMEBREW_NO_AUTO_UPDATE="1"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --exclude .git __pycache__'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_ALT_C_COMMAND='fd --type=d --hiden --strip-cwd-prefix --exclude .git __pycache__'
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


# Bat
alias cat="bat"
export BAT_THEME="Nord"

# Zoxide
eval "$(zoxide init zsh)"
alias cd='z' -f ~/.fzf.zsh ] && source ~/.fzf.zsh
