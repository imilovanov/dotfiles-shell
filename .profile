if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

export PATH="$PATH:/home/dev/.local/bin:/home/dev/.local/.scripts/:/home/dev/.local/apps/maven/bin"

export MANPATH="/usr/local/man:$MANPATH"

### You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR=/usr/bin/vim
### Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

export DOWNLOADS="/home/$USER/Downloads"
export BOOKS="/home/$USER/Books"
export WORK="/home/$USER/Work"
export MOUNT="/run/media/dev"
export SCRIPTS="/home/$USER/.local/.scripts"
export SNIPPETS="/home/$USER/.vim/snippets"
export WORKON_HOME="/home/$USER/envs"
export EXTENSIONS="/home/$USER/.local/share/gnome-shell/extensions"

export QT_QPA_PLATFORMTHEME="qt5ct"
export VIRSH_DEFAULT_CONNECT_URI="qemu:///system"
export BAT_THEME="Monokai Extended Light"
export FZF_COMPLETION_TRIGGER=';;'
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null ||
	cat {} || tree -C {}) 2> /dev/null | head -200'"
