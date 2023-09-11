# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/gardnerj/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

PATH=/opt/homebrew/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

zstyle :omz:plugins:iterm2 shell-integration yes

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aliases brew direnv battery fd git iterm2 kubectl-autocomplete macos pyenv shrink-path yarn z)
# kubectl kubectx
# too long: 
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# Go Path
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin

# Add jenv for selection of homebrew java version.
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Add personal bin dir
export PATH="$HOME/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/gardnerj/.sdkman"
[[ -s "/Users/gardnerj/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gardnerj/.sdkman/bin/sdkman-init.sh"

export DEFAULT_USER="gardnerj"

declare -A kubectx_mapping
kubectx_mapping["docker-desktop"]="desktop"
kubectx_mapping[scdc1-staging-vmw-piv-labs-admin]="$emoji[wolf_face]"
kubectx_mapping[production_cluster]="%{$fg[yellow]%}prod!%{$reset_color%}"

# include zsh configs
#source ~/.oh-my-zsh/custom.completion.kube.config

# Kubernetes
#export KUBECONFIG=~/.kube/cava-config.yaml

# Google Compute
export GDRIVE="/Users/gardnerj/Library/CloudStorage/GoogleDrive-huxoll@gmail.com/My Drive"

jhg_prompt_dir() {
  prompt_segment blue $CURRENT_FG "$(shrink_path -f -2)"
}

jhg_prompt_kube() {
  #prompt_segment blue $CURRENT_FG "$(kubectx_prompt_info)"
}
## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_aws
  prompt_context
  jhg_prompt_dir
  prompt_git
  prompt_bzr
  prompt_hg
  jhg_prompt_kube
  prompt_end
}

# move and rename
mvname() {
  echo mv "$1" "${1##*/}"
}

#setopt prompt_subst
#PS1='%{%f%b%k%} $(build_prompt) $(shrink_path -f)>'

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
#[[ -s "/Users/jgardner/.gvm/bin/gvm-init.sh" ]] && source "/Users/jgardner/.gvm/bin/gvm-init.sh"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Apps and Containers
# defeat muscle memory
alias e='code --goto'
alias more='less'
alias mroe='less'
alias ls='ls -F'

# Tools and utilities
alias t='history'
# Development shortcuts

# Current Project
alias gov="cd ~/Projects/VMware"
alias gop="cd ~/Projects/Personal"
alias gog="cd ~/Google\ Drive"
# VMware
alias vmrun="/Applications/VMWare\ Fusion.app/Contents/Library/vmrun"
# Kubernetes
alias k="kubectl"
alias kstaging="export KUBECONFIG=/Users/gardnerj/.kube/scdc1-staging-vmw-piv-labs.yaml"
alias kprod="export KUBECONFIG=/Users/gardnerj/.kube/scdc1-prod2-vmw-piv-labs.yaml"
function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

# Git
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gm='git merge --no-ff'
alias glog='git log --oneline --decorate'
#alias gup='git up'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gardnerj/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/gardnerj/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gardnerj/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/gardnerj/google-cloud-sdk/completion.zsh.inc'; fi

# Use direnv for per-directory settings.
eval "$(direnv hook zsh)"
