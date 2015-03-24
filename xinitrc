#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export LC_ALL="C"
export LC_COLLATE="C"
export LANGUAGE="en_US.UTF8"
export LC_LANG="en_US.UTF8"

xrandr -s 0

XRESOURCES="${HOME}/.Xresources"
[ -f ${XRESOURCES} ] && xrdb merge ${XRESOURCES}
xsetroot -cursor_name left_ptr
xsetroot -solid '#80a0f'

# if we have private ssh key(s), start ssh-agent and add the key(s)
id1=${HOME}/.ssh/identity
id2=${HOME}/.ssh/id_dsa
id3=${HOME}/.ssh/id_rsa
if [ -x /usr/bin/ssh-agent ] && [ -f $id1 -o -f $id2 -o -f $id3 ]; then
    eval `ssh-agent -s`
    ssh-add < /dev/null
fi

# Get the fonts cataloged
xset fp rehash
xset +fp /usr/share/fonts/misc
xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/local

xset b 100 0 0
xset r rate 170 30

# Rearrange the keys
XMODMAP="${HOME}/.Xmodmap"
[ -f ${XMODMAP} ] && xmodmap ${XMODMAP}

/usr/bin/xautolock -time 30 -locker /usr/bin/slock -secure -detectsleep -corners ++00 -cornerdelay 10 -cornerredelay 30 &
#/usr/bin/compton &
#/usr/bin/xbanish &
${HOME}/bin/random-wallpaper --timer 15m --setter '/usr/bin/hsetroot -solid \#390000 -tile' --wallpaper ${HOME}/usr/img/wallpaper/patterns &
$1 &

# wait for window manager
wait $!
