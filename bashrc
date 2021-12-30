
# enable color prompt with git baranch display
if [ -f ~/.local/bin/color.sh ]; then
    source ~/.local/bin/color.sh
    if [ -f ~/.local/bin/git-prompt.sh ]; then
        source ~/.local/bin/git-prompt.sh
        PS1='$(printf "\[$bldwht\]")\u@\h:$(printf "\[$bldblu\]")\w$(printf "\[$bldgrn\]")$(__git_ps1)$(printf "\[$bldwht\]") \$$(printf "\[$txtwht\]") '
    fi
fi

# disable rm if trash-put is install
if [ -x /usr/bin/trash-put ]; then
    alias rm='echo "Please use trash-put"; false'
fi

# execute local .bashrc
if [ -f ~/.local/.bashrc ]; then
    . ~/.local/.bashrc
fi

# Save history at every command prompt in order to prevent loose of history 
# at abnormal termination.
export PROMPT_COMMAND='history -a'
