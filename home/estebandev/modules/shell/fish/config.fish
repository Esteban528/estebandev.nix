# set prompt
fish_config prompt choose informative_vcs

# setup direnv
direnv hook fish | source

function fish_prompt
    ~/.local/bin/grompt
end
