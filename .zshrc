ZSH_THEME="bullet-train"

export ZSH="/home/$USER/.oh-my-zsh"

# User configuration




# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
plugins=(fzf-zsh extract)

source $ZSH/oh-my-zsh.sh

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ "$TERM" != "screen" ]] &&
        [[ "$SSH_CONNECTION" == "" ]]; then
    # Attempt to discover a detached session and attach
    # it, else create a new session

    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
        tmux -2 attach-session -t $WHOAMI
    else
        tmux -2 new-session -s $WHOAMI
    fi
else

    # One might want to do other things in this case,
    # here I print my motd, but only on servers where
    # one exists

    # If inside tmux session then print MOTD
    MOTD=/etc/motd.tcl
    if [ -f $MOTD ]; then
        $MOTD
    fi
fi


#if [ -f ~/fzf.zsh ]; then
#    . ~/fzf.zsh
#fi
source /home/$USER/.functions
#source /usr/local/bin/virtualenvwrapper.sh

[[ -s /home/dev/.autojump/etc/profile.d/autojump.sh ]] && source /home/dev/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u


