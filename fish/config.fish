# THIS FILE IS SIMILAR TO THE BASH_LOCAL...
if status is-interactive
    # Commands to run in interactive sessions can go here
    figlet "SHEFI @ FISH DLP" -w $COLUMNS | lolcat --animate --duration 2  --freq 1 --spread 5
end


# LOCAL FUNCTIONS IMPORTS
functions dataloop

# ENV VARS
set -gx WS ~/dlp_ws
set -gx SANDBOOX $WS/shefi_sandbox
set -gx GOOGLE_APPLICATION_CREDENTIALS ~/.config/gcloud/application_default_credentials.json
set -gx CUDA_VISIBLE_DEVICES ''  # So it will not try and use gpu for TF/TORCH

# UPDATE PATH
set -gx PYTHONPATH ~/bin $PYTHONPATH
set -gx PATH $PATH /opt/julia/julia-1.6.1/bin/   # JULIA

# ADDING TO VISUAL TERMINAL
set -g fish_prompt_pwd_dir_length 3         # upper dirs are shown with 3 chars
set fish_greeting                           # supress fish's intro message


# ALIASES - better not to use them....

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -h'
alias du='du -h -d1'

#alias grep='grep --color=auto'

# BINDS:
bind \cL 'clear -x; commandline -f repaint'  


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/conda/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

