# setup direnv
direnv hook fish | source
set -x PATH $HOME/.local/bin $HOME/bin $PATH
function fish_prompt
    ~/.local/bin/grompt
end
