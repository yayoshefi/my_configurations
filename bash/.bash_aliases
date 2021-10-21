alias l='less -SR'
alias src='source'
alias clc='clear'
alias cgrep='grep --color=always -I'

# some more ls aliases
alias ll='ls -lhF'
alias la='ls -Ah'
#alias l='ls -ChF'
alias ltr='ls -lhtr'

# human readable
alias du='du -h'
alias df='df -h' # | grep -v snap'

alias pretty-json='python3 -m json.tool'
# alias pip3='python3 -m pip'
alias pycharm='(flatpak run com.jetbrains.PyCharm-Community ./ & ) > /dev/null 2>&1'
alias jupyter-server='(jupyter notebook --no-browser ./ & ) > /dev/null 2>&1'


# open gvim with multiple tabs is multiple inputs
# alias g='gvim -p'

# # SHEFI  configuration 
# origin from yshefi@lebea configuration
#
# ESC-left-arrow : go to beginning of left word.        
# The second version is used to fix a strange bug where the binding
# stops working after some usage. Did not manage to recreate.
bind  '"\eOD": backward-word'  # use Ctrl-Left for moving the cursor
bind  '"\e\e[D": backward-word'
#bindkey	   OD     backward-word
#vi-word-back

# ESC-right-arrow : go to beginning of right word.
# The second version is used to fix a strange bug where the binding
# stops working after some usage. Did not manage to recreate.
bind '"\e0C": forward-word '
bind '"\e\e[C": forward-word '
#bindkey	   OC     forward-word 
#vi-word-fwd

# History search (like Esc-p of tcsh
bind '"\e\e[A": history-search-backward'
bind '"\e0A": history-search-backward'
bind '"\e0B": history-search-forward'

# avoids adding hidden file with tab-completeion
bind 'set match-hidden-files off'
# ==============
#   END OF BINDS
# ==============

# =========
# Functions
# =========
# new = make a dir and go into it
function new (){ mkdir $1; cd $1; }

# function to set terminal title
function set-title(){
  if [[ -z "$ORIG" ]]; then
    ORIG="$PS1"
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1="${ORIG}${TITLE}"
}

function my-jira(){
    google-chrome --app=https://eyezonai.atlassian.net/secure/Dashboard.jspa#
}

function my-swagger(){
    # --window-size x,y
    if [ ${1:-dev} == "dev" ]; then 
        echo "dev"
        google-chrome --new-window --app=https://dev-gate.dataloop.ai/api/v1/docs/ &
    elif [ $1 == "rc" ]; then
        echo "got rc"
        google-chrome --new-window --app=https://rc-gate.dataloop.ai/api/v1/docs/ &
    else
        echo "opening production"
        google-chrome --new-window --app=https://gate.dataloop.ai/api/v1/docs/ &
    fi
    # firefox --new-instance --new-window https://dev-gate.dataloop.ai/api/v1/docs/ &
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# check whether the screen is on or not - Usage in PS1 with arguments
function is-screen(){

    ps -fp$PPID | head -n 2 | tail -n 1 | egrep -q SCREEN
    screen_is_running=$((1 - ${PIPESTATUS[-1]}))
    # cut only the first occurrence of pid which is the screen pid
    screen_pid=`ps -fp$PPID | head -2 | tail -1 |  sed 's@^[^0-9]*\([0-9]\+\).*@\1@'`
    screen_name=$(screen -ls |grep ${screen_pid} | sed 's@^[^a-zA-Z]*\([a-zA-Z_]\+\).*@\1@')

    if [ $1 ]; then
        if [ $1 == 'bool' ]; then
            echo "$screen_is_running"
        fi
        if [ $screen_is_running == 1 -a $1 == 'id' ]; then
            echo "$screen_name"
        fi
    else # Default usage - no arguments
        if [ $screen_is_running == 1 ]; then
            echo "screen is running:"
            screen -ls |grep ${screen_pid}
        else
            echo "No, Screen is off. Avilable screens:"
            screen -ls | sed -e 's/\./\t/'
        fi
    fi

    #echo $screen_is_running
}

function today (){ date +%d_%m_%y; }

function open-my-rc() {
    gvim -p ~/.bashrc ~/.bash_aliases ~/.bash_eyezon ~/.bash_completion_local ~/.bash_local  ~/bin/
}
