#!/usr/bin/zsh

#######################################
# File   : ~/the-dot-files/install.sh #
# Author : jst <josh[at]jstolle.com>  #
# Desc   : Dotfiles installer         #
#######################################

# List of regular (non-X) and X packages to install
RPKGS=(compton git gnupg term tmux zsh)
XPKGS=(x xmonad)

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

# Install regular packages
function install_regular()
{
    for p $RPKGS stow $p
}

# Install X packages
function install_x()
{
    which xmonad > /dev/null 2>&1
    ISXMONAD=$?

    if [ $ISXMONAD -ne 0 ];then
        echo "Xmonad is required to install X packages.  It is either not installed or not in the eecution path.  Once  this issue is remedied, rerun this script." >&2
        exit 1
    fi

    for p $XPKGS stow $p
}

which stow > /dev/null 2>&1
ISSTOW=$?

if [ $ISSTOW -ne 0 ];then
    echo "Stow is required to use this installer.  It is either not installed or not in the execution path.  Once this issue is remedied, rerun this script." >&2
    exit 1
fi

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

case $INSTOPT in
    REG)  install_regular
          break
          ;;
    EKS)  install_x
          break
          ;;
    ALL)  install_regular
          install_x
          break
          ;;
    *  )  usage
          break
          ;;
esac
