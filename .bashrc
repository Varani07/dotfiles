case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

if [ -d "$HOME/.local/bin" ]; then
    case ":$PATH:" in
        *:"$HOME/.local/bin":*) ;;
        *) PATH="$HOME/.local/bin:$PATH" ;;
    esac
fi

if [ -d "$HOME/bin" ]; then
    case ":$PATH:" in
        *:"$HOME/bin":*) ;;
        *) PATH="$HOME/bin:$PATH" ;;
    esac
fi

export PATH

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

if ! shopt -oq posix; then
    for f in \
        /usr/share/bash-completion/bash_completion \
        /etc/bash_completion
    do
        if [ -f "$f" ]; then
            . "$f"
            break
        fi
    done
fi

if [ -d "/usr/local/odin" ]; then
    case ":$PATH:" in
        *:/usr/local/odin:*) ;;
        *) export PATH="$PATH:/usr/local/odin" ;;
    esac
fi

if [ -x "$HOME/miniconda3/bin/conda" ]; then
    __conda_setup="$("$HOME/miniconda3/bin/conda" shell.bash hook 2>/dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi
