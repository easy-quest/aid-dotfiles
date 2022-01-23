# ~/.bashrc: executed by bash(1) for non-login shells.
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

#NODE_HOME=~/node
#sh /root/.e.sh &
# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#NODE_PATH=~/node/lib/node_modules/npm

NODE_HOME=/usr/local
DISTRO=linux-arm64
PBR_VERSIO=N5.1.2
export PASSWORD=123456
#LANG=zh_CN.UTF-8
#export LD_PRELOAD=/usr/local/lib/libandroid-shmem.so
export XKB_DEFAULT_RULES=base
export QT_XKB_CONFIG_ROOT="/usr/share/X11/xkb:$QT_XKB_CONFIG_ROOT"

export PYTHONPATH=/usr/local/python3/lib/python3.6/site-packages/cv2/python-3.6/:$PYTHONPATH
export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:/usr/lib/aarch64-linux-gnu:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/python3/lib:/usr/local/lib/:$LD_LIBRARY_PATH

export CPLUS_INCLUDE_PATH=/opt/OpenBLAS/include:/usr/local/python3/incude:CPLUS_INCLUDE_PATH
export PATH=$PATH:/usr/local/python3/bin:$NODE_HOME/bin

cd /root;
#su demo;
source ./.f.sh
./.e.sh
cd /home;


# num=`pgrep sshd | wc -l`  
# if [ "$num" -lt "3" ]; then 
# 	/etc/init.d/ssh restart >/dev/null 2>&1 
# fi
# clear
 
# num=`pgrep filebrowser | wc -l`  
# if [ "$num" -lt "1" ]; then 
# cd /
# filebrowser -a 0.0.0.0 --noauth -r / >/dev/null 2>&1 & 
# cd /home
# fi
