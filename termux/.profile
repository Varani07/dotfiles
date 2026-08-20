alias nx='export LD_PRELOAD=/data/data/com.termux/files/usr/lib/libtermux-exec.so'
alias alpine='unset LD_PRELOAD && proot --link2symlink -0 -r ~/alpine-old/rootfs -b /dev/ -b /sys/ -b /proc/ -w /root /usr/bin/env -i HOME=/root PATH=/bin:/usr/bin:/sbin:/usr/sbin TERM="$TERM" SSH_TTY="$SSH_TTY" /bin/sh'
