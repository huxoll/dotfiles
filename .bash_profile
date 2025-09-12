# profile for bash

# Apps and Containers
# defeat muscle memory
alias cvs=svn
#alias e='subl'
alias e='code --goto'
alias more='less'
alias mroe='less'
alias ls='ls -F'

# Tools and utilities
alias t='history'
alias h='todo.sh'
# Development shortcuts

# Current Project
alias gov="cd ~/Projects/VMware"
alias gop="cd ~/Projects/Personal"
# Cloud Selection
# VMware
alias vmrun="/Applications/VMWare\ Fusion.app/Contents/Library/vmrun"
# Kubernetes
alias k="kubectl"
alias kstaging="export KUBECONFIG=/Users/gardnerj/.kube/scdc1-staging-vmw-piv-labs.yaml"
function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gm='git merge --no-ff'
alias glog='git log --oneline --decorate'
alias gup='git up'
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi

# Builds

#OSX
alias apinfo='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I'

# Enable python virtualenv
#source "/usr/local/bin/virtualenvwrapper.sh"

function gup
{
  # subshell for `set -e` and `trap`
  (
    set -e # fail immediately if there's a problem

    # use `git-up` if installed
    if type git-up > /dev/null 2>&1
    then
      exec git-up
    fi

    # fetch upstream changes
    git fetch

    BRANCH=$(git symbolic-ref -q HEAD)
    BRANCH=${BRANCH##refs/heads/}
    BRANCH=${BRANCH:-HEAD}

    if [ -z "$(git config branch.$BRANCH.remote)" -o -z "$(git config branch.$BRANCH.merge)" ]
    then
      echo "\"$BRANCH\" is not a tracking branch." >&2
      exit 1
    fi

    # create a temp file for capturing command output
    TEMPFILE="`mktemp -t gup.XXXXXX`"
    trap '{ rm -f "$TEMPFILE"; }' EXIT

    # if we're behind upstream, we need to update
    if git status | grep "Your branch" > "$TEMPFILE"
    then

      # extract tracking branch from message
      UPSTREAM=$(cat "$TEMPFILE" | cut -d "'" -f 2)
      if [ -z "$UPSTREAM" ]
      then
        echo Could not detect upstream branch >&2
        exit 1
      fi

      # can we fast-forward?
      CAN_FF=1
      grep -q "can be fast-forwarded" "$TEMPFILE" || CAN_FF=0

      # stash any uncommitted changes
      git stash | tee "$TEMPFILE"
      [ "${PIPESTATUS[0]}" -eq 0 ] || exit 1

      # take note if anything was stashed
      HAVE_STASH=0
      grep -q "No local changes" "$TEMPFILE" || HAVE_STASH=1

      if [ "$CAN_FF" -ne 0 ]
      then
        # if nothing has changed locally, just fast foward.
        git merge --ff "$UPSTREAM"
      else
        # rebase our changes on top of upstream, but keep any merges
        git rebase -p "$UPSTREAM"
      fi

      # restore any stashed changes
      if [ "$HAVE_STASH" -ne 0 ]
      then
        git stash pop
      fi

    fi

  )
}

#HOST=`hostname`
#INTIME=`date`
#echo "John Gardner logged onto $HOST at $INTIME" > ~/.plan
#cat ~/.basic.plan >> ~/.plan

#. /sw/bin/init.sh
export SUDO_PS1="\[\h:\w\] \u\\# "

# Go Path
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin

# Add jenv for selection of homebrew java version.
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Kubernetes
#export KUBECONFIG=~/.kube/cava-config.yaml

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
#[[ -s "/Users/jgardner/.gvm/bin/gvm-init.sh" ]] && source "/Users/jgardner/.gvm/bin/gvm-init.sh"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/gardnerj/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/gardnerj/google-cloud-sdk/completion.bash.inc'

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source ~/.profile
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export BASH_SILENCE_DEPRECATION_WARNING=1

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# iTerm2 tab titles
function title {
  if [ "$1" ] ; then
    test -e "${HOME}/.iterm2_shell_integration.bash" \
      && export PROMPT_COMMAND='__bp_precmd_invoke_cmd' \
      || unset PROMPT_COMMAND
    echo -ne "\033]0;${*}\007"
  else
    test -e "${HOME}/.iterm2_shell_integration.bash" \
      && export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007";__bp_precmd_invoke_cmd' \
      || export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
  fi
}
title

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/gardnerj/.sdkman"
[[ -s "/Users/gardnerj/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gardnerj/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/gardnerj/.cache/lm-studio/bin"
