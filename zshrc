# -*- shell-script -*-
#
# anrxc's init file for Z-SHELL 4.3.10 on Arch GNU/Linux.


# {{{ User settings

# {{{ Environment
export BROWSER="chromium"
export EDITOR="${VISUAL}"
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=10000
export LC_LANG=$LANG
export LESS="-R"
export LESSHISTFILE="-"
export PAGER="less"
export PATH="${HOME}/bin:${PATH}"
export READNULLCMD="${PAGER}"
export SAVEHIST=10000
export VISUAL="emacsclient -nw"
export XTERM="st-256color"
# }}}

# {{{ Dircolors
#     - with rxvt-256color support
eval `dircolors -b "${HOME}/.dir_colors"`
# }}}

# {{{ Manual pages
#     - colorize, since man-db fails to do so
export LESS_TERMCAP_mb=$'\E[01;31m'   # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'   # begin bold
export LESS_TERMCAP_me=$'\E[0m'       # end mode
export LESS_TERMCAP_se=$'\E[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\E[1;33;40m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'       # end underline
export LESS_TERMCAP_us=$'\E[1;32m'    # begin underline
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
alias free="free -m"
alias gpgd="gpg2 --decrypt"
alias gpge="gpg2 -ear jstolle"
alias grep="pcregrep --color=always"
alias iodrag="ionice -c3 nice -n19"
alias la='ls -lA'
alias last='last -adn 10'
alias ldi="ls -l | pcregrep '^d'"
alias lfi="ls -l | pcregrep -v '^d'"
alias ll="ls -l"
alias ls="ls -aF --color=always"
alias lst="ls -htl | pcregrep `date +%Y-%m-%d`"
alias mc=". /usr/lib/mc/mc-wrapper.sh -x"
alias more="less"
alias mv="mv -i"
alias passgen="< /dev/urandom tr -cd \[:graph:\] | fold -w 32 | head -n 5"
alias ping="ping -c 5"
alias play="play -v"
alias please='sudo'
alias psg="ps auxw | pcregrep -i "
alias psptree="ps auxwwwf"
alias rehash="hash -r"
alias rm="rm -i"
alias sat="date +%R"
alias shred="shred -uz"
alias spell="aspell -a <<< "
alias su="su - "
alias top="htop"
alias upmem="ps -eo pmem,pcpu,rss,vsize,args | sort -k 1"
alias vuser="fuser -v "
alias x="startx &! logout"
alias xpop="xprop | grep --color=none 'WM_CLASS\|^WM_NAME' | xmessage -file -"
alias xtr="extract"
# }}}

# {{{ Pacman
alias pacsy="sudo pacman -Sy"               # Sync & Update
alias pacup="sudo pacman -Syu"              # Sync, Update & Upgrade
alias pacdg="sudo pacman -Syuu"             # Sync, Update & Downgrade
alias paclu="pacman -Qu"                    # List upgradeable
alias pacin="sudo pacman -S"                # Install a specific package
alias pacnd="sudo pacman -Sdd"              # Install a package but ignore deps
alias pacrm="sudo pacman -Rns"              # Remove a specific package
alias pacrd="sudo pacman -Rdd"              # Remove a package but ignore deps
alias pacss="pacman -Ss"                    # Search for a package
alias pacsl="pacman -Qs"                    # Search for a package localy
alias pacsi="pacman -Si"                    # Package info
alias pacqi="pacman -Qi"                    # Package local info
alias pacls="pacman -Ql"                    # List files in a package
alias pacui="pacman -Qm"                    # List localy built packages
alias pacfi="pacman -Qo"                    # Which package file belongs to
alias paccl="sudo pacman -Scc"              # Fully clean the package cache
alias pacdl="sudo pacman -Swdd"             # Download a package without installing
alias paclo="pacman -Qdt"                   # List package orphans
alias paclog="pacman -Qc"                   # Package changelog
# }}}

# {{{ Packer
alias pkrsy="sudo packer -Sy"               # Sync & Update
alias pkrup="sudo packer -Syu"              # Sync, Update & Upgrade
alias pkrdg="sudo packer -Syuu"             # Sync, Update & Downgrade
alias pkrlu="packer -Qu"                    # List upgradeable
alias pkrin="sudo packer -S"                # Install a specific package
alias pkrnd="sudo packer -Sdd"              # Install a package but ignore deps
alias pkrrm="sudo packer -Rns"              # Remove a specific package
alias pkrrd="sudo packer -Rdd"              # Remove a package but ignore deps
alias pkrss="packer -Ss"                    # Search for a package
alias pkrsl="packer -Qs"                    # Search for a package localy
alias pkrsi="packer -Si"                    # Package info
alias pkrqi="packer -Qi"                    # Package local info
alias pkrls="packer -Ql"                    # List files in a package
alias pkrui="packer -Qm"                    # List localy built packages
alias pkrfi="packer -Qo"                    # Which package file belongs to
alias pkrcl="sudo packer -Scc"              # Fully clean the package cache
alias pkrdl="sudo packer -Swdd"             # Download a package without installing
alias pkrlo="packer -Qdt"                   # List package orphans
alias pkrlog="packer -Qc"                   # Package changelog
# }}}

# {{{ Completion
compctl -k "(add delete draft edit list import preview publish update)" nb
# }}}
# }}}


# {{{ ZSH settings
setopt emacs
setopt nohup
setopt autocd
setopt cdablevars
setopt ignoreeof
setopt nobgnice
setopt nobanghist
setopt clobber
setopt shwordsplit
setopt interactivecomments
setopt autopushd pushdminus pushdsilent pushdtohome
setopt histreduceblanks histignorespace inc_append_history

# Prompt requirements
setopt extended_glob prompt_subst
autoload -Uz zsh/terminfo && zsh/terminfo
autoload -Uz colors && colors
autoload -Uz promptinit && promptinit

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && \
    _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || \
    _global_ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && \
    _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || \
    _ssh_hosts=()
[ -r /etc/hosts ] && \
    : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || \
    _etc_hosts=()

hosts=(
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts
# New style completion system
autoload -U compinit; compinit
#  * List of completers to use
zstyle ":completion:*" completer _complete _match _approximate
#  * Allow approximate
zstyle ":completion:*:match:*" original only
zstyle ":completion:*:approximate:*" max-errors 1 numeric
#  * Selection prompt as menu
zstyle ":completion:*" menu select=1
#  * Menu selection for PID completion
zstyle ":completion:*:*:kill:*" menu yes select
zstyle ":completion:*:kill:*" force-list always
zstyle ":completion:*:processes" command "ps -au$USER"
zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;32"
#  * Don't select parent dir on cd
zstyle ":completion:*:cd:*" ignore-parents parent pwd
#  * Complete with colors
zstyle ":completion:*" list-colors ""

# Edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
# }}}

# {{{ Functions
function _runtabbed () {
    tabbed -dn tabbed-surf -r 2 surf -e '' "$uri" >"$xidfile" \
	2>/dev/null &
}

function trim  () { echo $1; }
function ddg   () { "${BROWSER}" "https://duckduckgo.com/?q=${*}" }
function pmem  () { ps -o rss,comm -p `pgrep "$1"` }
function dsync () { rsync -lprt --progress --stats --delete "$1/" "$2/" }

function extract () {
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

function surft () {
    xidfile="$HOME/tmp/tabbed-surf.xid"
    uri=""

    if [ "$#" -gt 0 ];
    then
	uri="$1"
    fi


    if [ ! -r "$xidfile" ];
    then
        _runtabbed
    else
        xid=$(cat "$xidfile")
        xprop -id "$xid" >/dev/null 2>&1
        if [ $? -gt 0 ];
        then
	    _runtabbed
        else
	    surf -e "$xid" "$uri" >/dev/null 2>&1 &
        fi
    fi
}

function snap () {
    [ "$2" ] && tmout="$2"  || tmout=5
    [ "$3" ] && format="$3" || format=png
    fname="${HOME}/$1-`date +%d%m%y-%H%M`"
    for ((i=${tmout}; i>=1; i--)) do; echo -n "${i}.. "; sleep 1; done
    import -window root -quality 100 "${fname}.${format}"
    convert -resize "15%" "${fname}.${format}" "${fname}.th.${format}"
    echo ": ${fname}.${format}"
}

function tmux () {
    local TMUX_COMMAND=$(which tmux)
    base_session="$1"

    # Set the default session name if  one was not passed in
    if test -z "${base_session}" ; then
        base_session="Main"
    fi

    # Only because I often issue `ls` to this script by accident
    if test "$1" == "ls" ; then
        ${TMUX_COMMAND} ls
        return
    fi

    # This actually works without the trim() on all systems except OSX
    tmux_nb=$(_trim $(${TMUX_COMMAND} ls | grep "^${base_session}" | wc -l))
    if test "${tmux_nb}" == "0" ; then
        echo "Launching tmux base session $base_session ..."
        ${TMUX_COMMAND} new-session -s ${base_session}
    else
        # Make sure we are not already in a tmux session
        if test -z "${TMUX}" ; then
            echo "Attaching to base session $base_session ..."
            # Attach to the session
            ${TMUX_COMMAND} attach-session -t ${base_session}
        fi
    fi
}

# {{{ Terminal and prompt
# Stolen from this forum post: http://nixers.net/showthread.php?tid=293&pid=3052#pid3052

setprompt() {
    local IT=${terminfo[sitm]}${terminfo[bold]}
    local ST=${terminfo[sgr0]}${terminfo[ritm]}
    local FMT_BRANCH='%F{9}(%s:%F{7}%{$IT%}%r%{$ST%}%F{9}) %F{11}%B%b %K{0}%{$IT%}%u%c%{$ST%}%k'
    local FMT_ACTION='(%F{3}%a%f)'
    local FMT_PATH='%F{1}%R%F{2}/%S%f'

    local RETURN='%(?..%F{9}%B!%b%f%F{1}%?%f )'
    local NAME='%F{4}%B%n%b%f'
    local HOST='%F{1}%B%m%b%f'
    local PATH='%F{8}[%F{3}%40<â€¦<%~%<<%F{8}]%f'
    local JOBS='%(1j.%K{1}%F{235}%B%j%b%f%k .)'
    local VIM=${${KEYMAP/vicmd/%K{2}%F{0} N %f%k }/(main|viins)/}

    local DE=${DEBUG:+%F{9}DEBUG%f }
    local VENV=${VIRTUAL_ENV:+%F{3}VENV%f }
    PROMPT="${vcs_info_msg_0_}${RETURN}${JOBS}${VENV}${DE}${NAME}%F{8}@%f${HOST}${PATH}
%B%#%b "
    RPROMPT=""
    PS2=%_

    # vcs_info
    zstyle ':vcs_info:*' enable git hg svn
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' unstagedstr '%F{62}D%F{237}IRTY%f'
    zstyle ':vcs_info:*' stagedstr '%F{62}S%F{237}TAGED'
    zstyle ':vcs_info:*' actionformats "${FMT_BRANCH}${FMT_ACTION}" "zsh: %r"
    zstyle ':vcs_info:*' formats       "${FMT_BRANCH}"              "zsh: %r"
    zstyle ':vcs_info:*' nvcsformats   ""                           "%~"
}

function zle-line-init zle-keymap-select {
    setprompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# }}}
