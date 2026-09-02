alias bs='vim ~/.bash_aliases'
alias sbs='source ~/.bashrc'
alias cbs='cat -n ~/.bash_aliases'

alias check_health='ps -eo pid,ppid,cmd,rss,%mem,%cpu --sort=-rss | head -20'

alias py='python'
alias py3='python3'
alias vim='nvim'
alias aria='aria2c -x 16 -s 16'
alias cls='clear'

alias fast_build='./build.bash && cd kzr/ && sudo ./install.bash && cd ..'

alias steam='prime-run steam'

# alias alpine='unset LD_PRELOAD && proot --link2symlink -0 -r ~/alpine-old/rootfs -b /dev/ -b /sys/ -b /proc/ -w /root /usr/bin/env -i HOME=/root PATH=/bin:/usr/bin:/sbin:/usr/sbin TERM="$TERM" /bin/sh'
# alias tmx_recover='export LD_PRELOAD=/data/data/com.termux/files/usr/lib/libtermux-exec.so'

export PATH="$HOME/.local/bin:$PATH"

if [ -d "$HOME/repos/dotfiles/scripts" ]; then
    export PATH="$PATH:$HOME/repos/dotfiles/scripts"
    for arquivo in $HOME/repos/dotfiles/scripts/*; do
        chmod 744 $arquivo
        source $arquivo
    done
fi

bsadd() {
    echo "$@" >> ~/.bash_aliases
}


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

if [[ "$(uname -m)" = "x86_64" ]]; then
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:/usr/local/odin
    alias superdate='sudo apt update && sudo apt upgrade -y && flatpak update && sudo snap refresh'
    alias suwa='cd ~/suwayomi && java -jar Suwayomi-Server*.jar --server.ip=0.0.0.0 > suwayomi.log 2>&1 &'
    alias scloud='rclone mount onedrive-pessoal: ~/onedrive --vfs-cache-mode writes --vfs-cache-max-age 24h --vfs-read-chunk-size 128M --daemon && rclone mount gdrive-pessoal: ~/gdrive --vfs-cache-mode writes --vfs-cache-max-age 24h --vfs-read-chunk-size 128M --daemon'
    # alias ns='flatpak run io.github.hrkfdn.ncspot'
    # alias cosp='RUST_LOG=off cosmic-player'
    yt() {
        yt-dlp -f "bestvideo+bestaudio" "$@"
    }
#   case $- in
#       *i*)
#           if ! pgrep -x sunshine >/dev/null; then
#               nohup sunshine >/dev/null 2>&1 &
#           fi
#           ;;
#   esac
fi
