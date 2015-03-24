#!/usr/bin/bash

#######################################
# File   : ~/the-dot-files/install.sh #
# Author : jst <josh[at]jstolle.com>  #
# Desc   : Dotfiles installer         #
#######################################

# Get the execution directory
EXECDIR=$(pwd)

# List of regular (non-X) and X packages to install
RPKGS=(bin git gnupg term tmux zsh)
XPKGS=(compton general_x xbin xmonad)

# The type of install; default value
INSTOPT="ALL"

# Usage statement
function usage()
{
    echo "$0 [-r | -x | -a ]" >&2
    echo "\nInstall packages in the directory using stow.\n" >&2
    echo "    -r    Install non-X packages" >&2
    echo "    -x    Install X packages" >&2
    echo "    -a    Install all packages (default)\n" >&2
    exit 1
}

# Internal functions
# Create directory if it does not exist
function _create_dir()
{
    [[ -e ${1} ]] && [[ -d ${1} ]] && return 0
    mkdir -p ${1}
}

# Install CLI scripts
function _install_bin()
{
    _create_dir ${HOME}/bin
    cp -fs ${EXECDIR}/bin/* ${HOME}/bin/
}
# Install compton
function _install_compton()
{
    cp -fs ${EXECDIR}/compton.conf ${HOME}/.compton.conf
}

# Install git
function _install_git()
{
    cp -fs ${EXECDIR}/gitconfig ${HOME}/.gitconfig
}

# Install gnupg
function _install_gnupg()
{
    _create_dir ${HOME}/.gnupg
    cp -fs ${EXECDIR}/gnupg/* ${HOME}/.gnupg
}

# Install term
function _install_term()
{
    cp -fs ${EXECDIR}/dir_colors ${HOME}/.dir_colors
}

# Install tmux
function _install_tmux()
{
    cp -fs ${EXECDIR}/tmux.conf ${HOME}/.tmux.conf
}

# Install zsh
function _install_zsh()
{
    cp -fs ${EXECDIR}/zshrc ${HOME}/.zshrc
}

# Install general X
function _install_general_x()
{
    cp -fs ${EXECDIR}/compton.conf ${HOME}/.compton.conf
    cp -fs ${EXECDIR}/conkerorrc ${HOME}/.conkerorrc
    cp -fs ${EXECDIR}/Xdefaults ${HOME}/.Xdefaults
    cp -fs ${EXECDIR}/xinitrc ${HOME}/.xinitrc
    cp -fs ${EXECDIR}/xsession ${HOME}/.xsession
}

# Install xbin
function _install_xbin()
{
    _create_dir ${HOME}/xbin
    cp -fs ${EXECDIR}/xbin/* ${HOME}/xbin/
}

# Install xmonad
function _install_xmonad()
{
    _create_dir ${HOME}/.xmonad
    _create_dir ${HOME}/.icons/xbm_icons/subtle
    cp -fs ${EXECDIR}/xmonad/xmonad.hs ${HOME}/.xmonad
    cp -fs ${EXECDIR}/xmonad/*.xbm ${HOME}/.icons/xbm_icons/subtle/
}

# Generic installer logic
function _install_pkgs()
{
    for p in $@; do
        eval _install_${p}
    done
}

# Package installer
function _install_pkg()
{
    PKG=${1}
    DESTDIR=${2}

    if [[ ! -e ${DESTDIR} ] && [ ! -d ${DESTDIR} ]];then
        mkdir -p ${DESTDIR}
    fi

    ${STOW} --no-folding --dir=${BASEDIR} --target=${DETDIR} ${PKG}
}

# Install regular packages
function _install_regular()
{
    _install_pkgs $RPKGS
}

# Install X packages
function _install_x()
{
    _install_pkgs $XPKGS
}

while getopts arx opt
do
    case $opt in
        a)  break;;
        r)  INSTOPT="REG"
            break;;
        x)  INSTOPT="EKS"
            break;;
        *)  INSTOPT="BAD"
            break;;
    esac
done

# Package remover
function _uninstall_pkg()
{
    PKG=${1}
    DESTDIR=${2}

    ${STOW} -R --no-folding --dir=${BASEDIR} --target=${DETDIR} ${PKG}
}

shift $((${OPTIND} - 1))

case $INSTOPT in
    REG)  _install_regular
          ;;
    EKS)  _install_x
          ;;
    ALL)  _install_regular
          _install_x
          ;;
    *  )  usage
          ;;
esac

while [[ $# -gt 0 ]];do
    eval _install_${1}
    shift
done
