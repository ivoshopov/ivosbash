
# enable color prompt with git barach display
if [ -f ~/bin/color.sh ]; then
    source ~/bin/color.sh
    if [ -f ~/bin/git-prompt.sh ]; then
        source ~/bin/git-prompt.sh
        PS1='$(printf "\[$bldwht\]")$(whoami)@$(hostname):$(printf "\[$bldblu\]")$(pwd)$(printf "\[$bldgrn\]")$(__git_ps1)$(printf "\[$bldwht\]") \$$(printf "\[$txtwht\]") '
    fi
fi

# disable rm if trash-put is install
if [ -x /usr/bin/trash-put ]; then
    alias rm='echo "Please use trash-put"; false'
fi

# execute local .bashrc
if [ -f ~/local/.bashrc ]; then
    . ~/local/.bashrc
fi
