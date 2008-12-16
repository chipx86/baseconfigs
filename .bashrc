#!/bin/sh

alias ls="ls --color=auto -p"
alias sl=ls

export HTTP_PROXY=http://proxy.vmware.com:3128/
export http_proxy="$HTTP_PROXY"
export FTP_PROXY="$HTTP_PROXY"
export ftp_proxy="$HTTP_PROXY"

CYAN="\[\e[36m\]"
BOLDCYAN="\[\e[36;1m\]"
NORMAL="\[\e[0m\]"
#TITLEBAR="\[\e]2;\u@\h:\w\a"

export PS1="$TITLEBAR$CYAN\u$BOLDCYAN@$NORMAL$CYAN\h$BOLDCYAN:\w\$ $NORMAL"
#export PS1="\u@\h:\w\$ "

#export PKG_CONFIG_PATH=/opt/gnome2/lib/pkgconfig:/usr/lib/pkgconfig
#export ACLOCAL_FLAGS="-I /opt/gnome2/share/aclocal"
#export LD_LIBRARY_PATH="/opt/gnome2/lib:/usr/local/lib:/usr/lib"
#export PYTHONPATH="/opt/gnome2/lib/python2.2/site-packages:/usr/lib/python2.2/site-packages"
#export XDG_DATA_DIRS="/opt/gnome2/share:/usr/local/share:/usr/share"

export P4CONFIG=.p4config
export P4CMD=/home/christian/bin/p4
export P4DIFF='diff -druN'
export EDITOR=vim
export VISUAL=vim

#export PATH="$HOME/bin:/opt/gnome2/bin:$HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"

oldterm=$TERM
if test "x$TERM" == "xscreen"; then
  TERM=xterm
fi

eval `dircolors -b $HOME/.dircolorsrc`

TERM=$oldterm

alias cvsview="export CVS_RSH=ssh ; export CVSROOT=':ext:chipx86@cvs-ssh.sourceforge.net:/cvsroot/view'"

export LANG=C

export INPUTRC=$HOME/.inputrc
