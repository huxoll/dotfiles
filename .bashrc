# startup file for bash

[[ -z $DISPLAY ]] && export DISPLAY=":0.0"

# this is broken: PS1='\[\e]2;$PWD\[\a\]\[\e]1;\W\[\a\][\u@\h \W]\\$ '
# Prior: PS1='\[\e]0;${PWD}\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\$ '
PS1='\[\e]0;${PWD}\a\]\[\e[32m\]${USER/#gardnerj/me}@\h \[\e[33m\]\W\[\e[0m\]\$ '

PATH=.:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
MANPATH=/opt/local/share/man:$MANPATH

# GSUtil
PATH=/usr/local/gsutil:$PATH

# VMware CloudClient
PATH=~/CloudClient-4.3.0/bin:$PATH

export EDITOR=vi
export PATH PS1

export DOCKER_ID_USER="huxoll"
# Source the z utility: http://github.com/rupa/z
. /Users/gardnerj/bin/z.sh

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
#[[ -s "/Users/jgardner/.gvm/bin/gvm-init.sh" ]] && source "/Users/jgardner/.gvm/bin/gvm-init.sh"

GIT_PROMPT_THEME=gardnerj
## BEGIN Ansible gitprompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
## END Ansible gitprompt
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/.yarn/bin:$PATH"
export PATH=/Users/gardnerj/bin:$PATH:ZZZ

# added by travis gem
[ -f /Users/gardnerj/.travis/travis.sh ] && source /Users/gardnerj/.travis/travis.sh
export BYOBU_PYTHON='/usr/bin/env python'

export KUBECONFIG="$HOME/.kube/pselab-config.yaml"
# Path to your oh-my-bash installation.
export OSH=/Users/gardnerj/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="powerline"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

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

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
. "$HOME/.cargo/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/gardnerj/.cache/lm-studio/bin"
