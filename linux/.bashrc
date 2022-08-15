# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples




# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# CUSTOM PATH 
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# export yarn path 
export PATH="$HOME/.yarn/bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.nvm/.nvm.sh
echo "NVM Loaded"
nvm use default


#############################
###### Custom Things ########
#############################
# NVIM path 
if [-h '/usr/local/bin/nvim']; then 
    alias nvim '/usr/bin/nvim'
fi


neofetch --ascii_distro ubuntu
alias rs='rescuetime'

# UpdateLinuxSetupScripts() {
# 	cd ~/Linux-Setup-Scripts/linux
# 	git pull
# 	./mvBash.sh
# 	echo "Pulling updates from latest .bashrc file stored at https://github.com/andrew-pynch/linux-setup-scripts"
# 	cd
# }

# UpdateLinuxSetupScripts

# don't put duplicate lines or lines starting with space in the history.

# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
alias config='/usr/bin/git --git-dir=/home/andrew/.cfg/ --work-tree=/home/andrew'

export PATH=/usr/local/cuda/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH
export PATH=$PATH:/home/andrew/bin
alias git=hub
alias gpr='git pull-request -m "$(git log -1 --pretty=%B)"'
clonefork() {
hub clone "$1"
cd "${1##*/}"
hub fork
}
export PATH=~/swift/usr/bin:$PATH
export PATH=/usr/local/cuda-10.0/bin:$PATH
export PATH=~/swift/usr/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andrew/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=~/swift/usr/bin:$PATH

alias gomass='cd /media/andrew/mass/Github'
alias jl='jupyter-lab'
alias jn='jupyter-notebook'
alias fs='xdg-open .'
alias templ-disabled='/home/andrew/Github/Ishiiruka/build/Binaries/dolphin-emu'
alias dol='dolphin-emu'
alias bse='vim ~/.bashrc'
alias sshosu="ssh 'pyncha@oregonstate.edu'@flip.engr.oregonstate.edu"
alias gmf="cd /mnt/c/Users/HZYJ10/Git/GM" 
alias pgf="cd ~/Github"
alias peg="cd /mnt/e/Github"
alias start='/mnt/c/Windows/System32/cmd.exe /c "start ."'
alias clr='rm -rf *'
alias wthr='curl wttr.in'
alias ubrc='UpdateBashRC'
alias govids='cd /mnt/d/Video'
alias mkvid='MakeVideo'

UpdateBashRC() {
    cd ~/linux-setup-scripts 
    ./mvBash.sh
    bash
}

MakeVideo() {
    mkdir $1
    cd $1
    mkdir Clips
    mkdir Images
    mkdir Music
    mkdir Audio
    mkdir Footage
}

# Misc Asliases
# =============
alias lsl='ls -l'

# Git Aliases
# ===========
alias gcl='CloneAndrewRepo'
alias gpl='git pull'
alias gaa='git add --all'
alias gam='git commit -a -m'
alias gpu='git push'
alias gba='git branch -a'
alias gb='git branch'
alias gc='git checkout'
alias gbgc='BranchAndCheckout'
alias gm='git merge'
alias gpsu='PushBranchSetUpstream'
alias gl='git log'
alias gsa='git stash --all'
alias gbsc='git branch --show-current'
alias sa='ShowAliases'
alias inr='InitNewRepo'
alias grh='ResetCommitHash'
alias gbdl='GitBranchDeleteLocal'
alias gbdo='GitBranchDeleteOrigin'
alias editbashrc='nvim ~/Linux-Setup-Scripts/linux/.bashrc'
alias srcbashrc='source ~/.bashrc'
alias reseti3="ResetI3"

ResetI3() {
    i3-msg reload 
    i3-msg restart
}

GitBranchDeleteLocal() {
    git branch -d $1
}

GitBranchDeleteOrigin() {
    git push origin --delete $1
}

PushBranchSetUpstream() {
    git push --set-upstream origin $1
}

BranchAndCheckout() {
    git branch $1 && git checkout $1
}

InitNewRepo() {
    mkdir $1
    cd $1
    git init
    touch README.md 
    git add --all
    git commit -a -m "Add README.md"
}

ResetCommitHash() {
    git reset --hard $1
    git reset --soft HEAD@{1}
    git commit -a -m "Revert head..."
    git push
}

# Clone a repo of a given name from my github
CloneAndrewRepo() {
	git clone 'https://github.com/andrew-pynch/'$1
	cd $1
}



# Wallpapers 
echo "Setting Wallpaper"
feh --bg-fill "~/Linux-Setup-Scripts/wallpapers/mha_best_girl.jpg"

# Export custom prompt 
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[38;5;41m\]\w\[$(tput sgr0)\]:\[\033[38;5;63m\]\$(parse_git_branch)\[$(tput sgr0)\]$\[$(tput sgr0)\] "