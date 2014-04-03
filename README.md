the-dot-files
=============

These are my dot files (or most of them).  This is a constantly moving target,
but I'll do my best to keep up with the modifications.

Each directory here holds some kind of dotfiles in a way in which
[GNU stow][1] can install them into the home directory.  The installer.sh
script runs stow against each package.  This is explained in greater detail
below.

Please don't hesitate to send me questions and/or fixes if something is
broken.

&installer.sh& -- The installer script.  The usage is as follows:

    installer.sh [-a|-r|-x]
        -a    Install all packages in the directory (default behavior)
        -r    Install only the regular packages (non-X)
        -x    Install only the X packages

`compton` &mdash; Settings for [Compton][2]

`git` &mdash; Settings for [git][3]

`gnupg` &mdash; Settings for [gnupg][4]

`ssh` &mdash; Settings for [ssh][5] (currently empty)

`term` &mdash; Generic terminal settings (only a dump from <code>dircolors -p</code> for now)

`tmux` &mdash; Settings for [tmux][6] (stolen from [dotphiles][7] for now)

`x` -- Settings for X (Xmodmap is mine, but Xdefaults is plagiarized from [anrxc][8]

`xmonad` &mdash; Settings Xmonad setup completely stolen from [nnoell][9] (for now; I
will be tinkering)

`zsh` &mdash; My zshrc file which is currently a gossamer veil over oh-my-zsh (which
I have already omitted from this list

[1]: http://www.gnu.org/software/stow/ "GNU stow"
[2]: https://github.com/chjj/compton "Compton homepage"
[3]: http://git-scm.com/ "git homepage"
[4]: http://www.gnu.org/software/gnupg/ "GnuPG homepage"
[5]: http://www.openssh.com/ "OpenSSH hoomepage"
[6]: http://tmux.sourceforge.net/ "tmux homepage"
[7]: https://github.com/dotphiles/dotphiles "dotphiles base repository"
[8]: http://git.sysphere.org/dotfiles/tree/Xdefaults "anrxc's .Xdefaults"
[9]: https://github.com/nnoell "Github page of nnoell"
[10]: http://zsh.sourceforge.net/ "Zsh hoomepage"
