# -*- shell-script -*-
#
# anrxc's init file for Z-SHELL 4.3.10 on Arch GNU/Linux.
#
# Modified and repurposed for oksh 0.5.0-1 on Arch GNU/Linux.


# {{{ User settings

# {{{ Environment
export PLAN9=/opt/plan9
export BROWSER="/usr/bin/conkeror"
export EDITOR="${VISUAL}"
export GOPATH="${HOME}/var/misc/goprojects"
export HISTFILE="${HOME}/.ksh_history"
export HISTSIZE=10000
export LC_LANG=$LANG
export LESS="-R"
export LESSHISTFILE="-"
export LESSOPEN="| /usr/bin/lesspipe.sh %s"
export PAGER="most -c"
export MANPATH="${MANPATH}"
export PATH="${HOME}/bin:${PATH}:${GOPATH}/bin"
export READNULLCMD="${PAGER}"
export SAVEHIST=10000
export VISUAL="emacsclient -nw"
export XTERM="st-256color"
# }}}

# {{{ Dircolors
#     - with rxvt-256color support
eval `dircolors -b "${HOME}/.dir_colors"`
# }}}

# {{{ Aliases

# {{{ Main
alias -- -='cd -'
alias ...="cd ../.."
alias ..="cd .."
alias _='sudo'
alias calc="bc -l <<<"
alias cls="clear"
alias cp="cp -ia"
alias df="df -hT"
alias du="du -hc"
alias dus="du -S | sort -n"
alias ec="emacsclient -a emacs -n "
alias ect="emacsclient -a emacs -t "
alias ejct="sudo /usr/bin/eject "
alias free="free -m"
alias fuck='sudo $(fc -nl -1)'
alias gpgd="gpg2 --decrypt"
alias gpge="gpg2 -ear jstolle"
alias grep="ag"
alias iodrag="ionice -c3 nice -n19"
alias la='ls -lA'
alias last='last -adn 10'
alias ldi="ls -l | ag --nocolor '^d'"
alias lfi="ls -l | ag --nocolor -v '^d'"
alias ll="ls -l"
alias lst="ls -tl | ag --nocolor \"$(date +%Y-%m-%d)\""
alias mc=". /usr/lib/mc/mc-wrapper.sh -x"
alias more="most"
alias mv="mv -i"
alias passgen="< /dev/urandom tr -cd \[:graph:\] | fold -w 32 | head -n 5"
alias passtxt="< /dev/urandom tr -cd \[:alnum:\] | fold -w 32 | head -n 5"
alias ping="ping -c 5"
alias play="play -v"
alias please='sudo'
alias psg="ps auxw | ag --nocolor -i "
alias psptree="ps auxwwwf"
alias rehash="hash -r"
alias rm="rm -i"
alias sat="date +%R"
alias shit='sudo $(fc -nl -1)'
alias shred="shred -uz"
alias spell="aspell -a <<< "
alias su="su - "
alias top="htop"
alias upmem="ps -eo pmem,pcpu,rss,vsize,args | sort -k 1"
alias vuser="fuser -v "
alias x="startx &! logout"
alias xpop="xprop | ag --nocolor 'WM_CLASS\|^WM_NAME' | xmessage -file -"
alias xtr="extract"
# }}}

# {{{ Pacman
alias pacsy="sudo pacman -Sy"    # Sync & Update
alias pacup="sudo pacman -Syu"   # Sync, Update & Upgrade
alias pacdg="sudo pacman -Syuu"  # Sync, Update & Downgrade
alias paclu="pacman -Qu"         # List upgradeable
alias pacin="sudo pacman -S"     # Install a specific package
alias pacnd="sudo pacman -Sdd"   # Install a package but ignore deps
alias pacrm="sudo pacman -Rns"   # Remove a specific package
alias pacrd="sudo pacman -Rdd"   # Remove a package but ignore deps
alias pacss="pacman -Ss"         # Search for a package
alias pacsl="pacman -Qs"         # Search for a package localy
alias pacsi="pacman -Si"         # Package info
alias pacqi="pacman -Qi"         # Package local info
alias pacls="pacman -Ql"         # List files in a package
alias pacui="pacman -Qm"         # List localy built packages
alias pacfi="pacman -Qo"         # Which package file belongs to
alias paccl="sudo pacman -Scc"   # Fully clean the package cache
alias pacdl="sudo pacman -Swdd"  # Download a package without installing
alias paclo="pacman -Qdt"        # List package orphans
alias paclog="pacman -Qc"        # Package changelog
# }}}

# {{{ Packer
alias packer="~/bin/packer --auronly"
alias pkrsy="packer -Sy"         # Sync & Update
alias pkrup="packer -Syu"        # Sync, Update & Upgrade
alias pkrdg="packer -Syuu"       # Sync, Update & Downgrade
alias pkrlu="packer -Qu"         # List upgradeable
alias pkrin="packer -S"          # Install a specific package
alias pkrnd="packer -Sdd"        # Install a package but ignore deps
alias pkrrm="packer -Rns"        # Remove a specific package
alias pkrrd="packer -Rdd"        # Remove a package but ignore deps
alias pkrss="packer -Ss"         # Search for a package
alias pkrsl="packer -Qs"         # Search for a package localy
alias pkrsi="packer -Si"         # Package info
alias pkrqi="packer -Qi"         # Package local info
alias pkrls="packer -Ql"         # List files in a package
alias pkrui="packer -Qm"         # List localy built packages
alias pkrfi="packer -Qo"         # Which package file belongs to
alias pkrcl="packer -Scc"        # Fully clean the package cache
alias pkrdl="packer -Swdd"       # Download a package without installing
alias pkrlo="packer -Qdt"        # List package orphans
alias pkrlog="packer -Qc"        # Package changelog
# }}}

# {{{ Yaourt
alias yrtsy="yaourt -Sy"         # Sync & Update
alias yrtup="yaourt -Syu"        # Sync, Update & Upgrade
alias yrtdg="yaourt -Syuu"       # Sync, Update & Downgrade
alias yrtlu="yaourt -Qu"         # List upgradeable
alias yrtin="yaourt -S"          # Install a specific package
alias yrtnd="yaourt -Sdd"        # Install a package but ignore deps
alias yrtrm="yaourt -Rns"        # Remove a specific package
alias yrtrd="yaourt -Rdd"        # Remove a package but ignore deps
alias yrtss="yaourt -Ss"         # Search for a package
alias yrtsl="yaourt -Qs"         # Search for a package localy
alias yrtsi="yaourt -Si"         # Package info
alias yrtqi="yaourt -Qi"         # Package local info
alias yrtls="yaourt -Ql"         # List files in a package
alias yrtui="yaourt -Qm"         # List localy built packages
alias yrtfi="yaourt -Qo"         # Which package file belongs to
alias yrtcl="yaourt -Scc"        # Fully clean the package cache
alias yrtdl="yaourt -Swdd"       # Download a package without installing
alias yrtlo="yaourt -Qdt"        # List package orphans
alias yrtlog="yaourt -Qc"        # Package changelog
# }}}

# {{{ Functions
function _runtabbed {
    tabbed -dn tabbed-surf -r 2 surf -e '' "${uri}" >"${xidfile}" 2>/dev/null &
}

function trim  { echo $1; }
function ddg   { "${BROWSER}" "https://duckduckgo.com/?q=${*}"; }
function pmem  { ps -o rss,comm -p $(ag --nocolor "${1}"); }
function dsync { rsync -lprt --progress --stats --delete "${1}/" "${2}/"; }

function extract {
    if test -f "$1"; then
        case "$1" in
            *.tbz2 | *.tar.bz2) tar -xvjf  "$1"     ;;
            *.txz | *.tar.xz)   tar -xvJf  "$1"     ;;
            *.tgz | *.tar.gz)   tar -xvzf  "$1"     ;;
            *.tar | *.cbt)      tar -xvf   "$1"     ;;
            *.zip | *.cbz)      unzip      "$1"     ;;
            *.rar | *.cbr)      unrar x    "$1"     ;;
            *.arj)              unarj x    "$1"     ;;
            *.ace)              unace x    "$1"     ;;
            *.bz2)              bunzip2    "$1"     ;;
            *.xz)               unxz       "$1"     ;;
            *.gz)               gunzip     "$1"     ;;
            *.7z)               7z x       "$1"     ;;
            *.Z)                uncompress "$1"     ;;
            *.gpg)       gpg2 -d "$1" | tar -xvzf - ;;
            *) echo "Error: failed to extract $1" ;;
        esac
    else
        echo "Error: $1 is not a valid file for extraction"
    fi
}

function surft {
    typeset xidfile="${HOME}/tmp/tabbed-surf.xid"
    typeset uri=""

    if test "$#" -gt 0 ; then
        uri="$1"
    fi


    if test ! -r "$xidfile" ; then
        _runtabbed
    else
        typeset xid=$(cat "$xidfile")
        xprop -id "$xid" >/dev/null 2>&1
        if test $? -gt 0 ; then
            _runtabbed
        else
            surf -e "$xid" "$uri" >/dev/null 2>&1 &
        fi
    fi
}

function snap {
    test -n "$2" && tmout="$2"  || tmout=5
    test -n "$3" && format="$3" || format=png
    typeset fname="${HOME}/$1-`date +%d%m%y-%H%M`"
    typeset -i i=${tmout}
    until (( i == 0 )) do echo -n "${i}.. "; i=$(( i - 1 )); sleep 1; done
    import -window root -quality 100 "${fname}.${format}"
    convert -resize "15%" "${fname}.${format}" "${fname}.th.${format}"
    echo ": ${fname}.${format}"
}

function tmux {
    typeset TMUX_COMMAND="/usr/bin/tmux"
    typeset MC_COMMAND="/usr/lib/mc/mc-wrapper.sh"
    typeset base_session="$1"

    # Set the default session name if  one was not passed in
    if test -z "${base_session}" ; then
        base_session="Main"
    fi

    # Only because I often issue `ls` to this script by accident
    if [[ "${base_session}" == "ls" ]]; then
        ${TMUX_COMMAND} ls
        return
    fi

    test -z "${TMUX}" || return

    ${TMUX_COMMAND} has-session -t ${base_session}
    running=$?

    [ "${running}" -eq "1" ] && \
        ${TMUX_COMMAND} new-session -d -s ${base_session} ${SHELL} \; new-window -d -t ${base_session} -n MC ${MC_COMMAND}

    ${TMUX_COMMAND} new-session -A -s ${base_session}
}

# }}}

# {{{ Prompt

export PS1="\e[1;34m\u\e[0m@\e[1;31m\h\e[0m[\e[1;31m\w\e[0m]\n\\$ "

# }}}
