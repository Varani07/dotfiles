alias suwa='cd ~/suwayomi && java -jar Suwayomi-Server*.jar --server.ip=0.0.0.0 > suwayomi.log 2>&1 &'

alias bs='vim ~/.bashrc'
alias sbs='source ~/.bashrc'
alias cbs='cat -n ~/.bashrc'

alias superdate='sudo apt update && sudo apt upgrade -y && flatpak update && sudo snap refresh'
alias check_health='ps -eo pid,ppid,cmd,rss,%mem,%cpu --sort=-rss | head -20'

alias py='python'
alias vim='nvim'
alias aria='aria2c -x 16 -s 16'
alias scloud='rclone mount onedrive-pessoal: ~/onedrive --vfs-cache-mode writes --vfs-cache-max-age 24h --vfs-read-chunk-size 128M --daemon && rclone mount gdrive-pessoal: ~/gdrive --vfs-cache-mode writes --vfs-cache-max-age 24h --vfs-read-chunk-size 128M --daemon'
alias ns='flatpak run io.github.hrkfdn.ncspot'
alias cosp='RUST_LOG=off cosmic-player'
alias cls='clear'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/varani/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/varani/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/varani/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/varani/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ -d "$HOME/repos/dotfiles/scripts" ]; then
    export PATH="$PATH:$HOME/repos/dotfiles/scripts"
    for arquivo in $HOME/repos/dotfiles/scripts/*; do
        chmod 744 $arquivo
        source $arquivo
    done
fi

bsadd() {
    echo "$@" >> ~/.bashrc
}

yt() {
    yt-dlp -f "bestvideo+bestaudio" "$@"
}
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/odin

osc52-copy() {
    local text
    if [ $# -gt 0 ]; then
        text="$*"
    else
        text="$(cat)"
    fi
    local encoded
    encoded=$(echo -n "$text" | base64 | tr -d '\n')
    echo -ne "\033]52;c;${encoded}\007" 
}

if [ -n "$SSH_TTY" ]; then
    alias copy='osc52-copy'
else
    alias copy='wl-copy'
fi

case $- in
    *i*)
        if ! pgrep -x sunshine >/dev/null; then
            nohup sunshine >/dev/null 2>&1 &
            touch $HOME/prova.txt
        fi
        ;;
esac
