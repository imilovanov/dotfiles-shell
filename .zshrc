# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/home/dev/.local/bin:/home/dev/.local/.scripts/"

ZSH_THEME="bullet-train"

export ZSH="/home/$USER/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

#You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

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
# FUNCTIONS
function urldecode { printf $(echo -n $1 | sed 's/\\/\\\\/g;s/\(%\)\([0-9a-fA-F][0-9a-fA-F]\)/\\x\2/g'); }
#function urlencode { python -c "import sys, urllib2; print urllib2.quote_plus('$1')"; }
function de_trans { trans :de "$1" -b | xclip -selection clipboard; }
function last_ip { cat access.log | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{printf "%-8s ==> %s\n", $2, $1}' | head -10; }
function mkdircd { mkdir $1 && cd $_; }
function weather { curl wttr.in/$1; }
function find_larger { find / -type f -size +$1; }
function wget_untar { wget -qO - "$1" | tar zxvf -; }
function wget_files { wget -r -l1 --no-parent -nH -nd ‐U Mozilla -P/tmp -A"$1" $2; } # wget .gif,.jpg http://example.com/images
function wget_howold { wget -S --spider $1 2>&1 | grep Mod  }
function wget_site { wget --random-wait -r -p -e robots=off -U mozilla $1 }       #download entire site       
function down4me { wget -qO - "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';}


# `o` with no arguments opens the current directory, otherwise opens the given
# # location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

export WORKON_HOME="~/home/$USER/envs"
#export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
export BOOKS="/home/$USER/Books"
export WORK="/home/$USER/Work"
export EXTENSIONS="/home/$USER/.local/share/gnome-shell/extensions"
export MOUNT="/run/media/dev"
#source /usr/local/bin/virtualenvwrapper.sh

[[ -s /home/dev/.autojump/etc/profile.d/autojump.sh ]] && source /home/dev/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

