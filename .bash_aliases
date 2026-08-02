
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

