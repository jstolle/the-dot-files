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

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xrandr -s 0

xrdb merge ${HOME}/.Xresources
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

xset fp+ /usr/share/fonts/misc
xset fp+ /usr/share/fonts/TTF

# xset fp rehash
xset b 100 0 0
xset r rate 170 30

xmodmap -e "keycode 233 = Page_Down"
xmodmap -e "keycode 234 = Page_Up"

xmonad &

# wait for xmonad
wait $!
