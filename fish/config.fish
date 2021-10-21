# THIS FILE IS SIMILAR TO THE BASH_LOCAL...
if status is-interactive
    # Commands to run in interactive sessions can go here
    figlet "SHEFI @ FISH DLP"
end


# LOCAL FUNCTIONS IMPORTS
# functions dataloop

# ENV VARS
set -gx WS ~/dlp_ws
set -gx SANDBOOX $WS/shefi_sandbox
set -gx GOOGLE_APPLICATION_CREDENTIALS ~/.config/gcloud/application_default_credentials.json

# UPDATE PATH
set -gx PYTHONPATH ~/bin $PYTHONPATH
set -gx PATH $PATH /opt/julia/julia-1.6.1/bin/



# ALIASES

alias clear='/bin/clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo;'


# navigation
alias ..='cd ..'
alias ...='cd ../..'

#alias grep='grep --color=auto'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/conda/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

