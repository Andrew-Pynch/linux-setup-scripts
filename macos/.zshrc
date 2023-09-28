# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="philips"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export ZSH="$HOME/.oh-my-zsh"

. "$HOME/.cargo/env"
export PATH=/Users/andrewpynch/.local/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#############################
###### Custom Things ########
#############################
alias rs='rescuetime'

UpdateLinuxSetupScripts() {
	cd ~/linux-setup-scripts
	git pull
	./mvBash.sh
	echo "Pulling updates from latest .bashrc file stored at https://github.com/andrew-pynch/linux-setup-scripts"
	cd
}

# MACOS Aliases 
alias tm="tmux"
alias kp='KillPort'
KillPort() {
    lsof -ti tcp:$1 | xargs kill -9
}


alias lsl='ls -l'
alias gomass='cd /media/andrew/mass/Github'
alias jl='jupyter-lab'
alias jn='python3 -m notebook'
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
alias mono='cd ~/Github/PX_Mono'
alias monoa='cd ~/Github/PX_Mono/apps/middleware/functions'
alias kp='KillPort'
alias restartaudio='pulseaudio -k && sudo alsa force-reload'
alias restartfakecamera='RebootFakeCamera'

RebootFakeCamera() {
    # Remove the fake camera
    sudo modprobe --remove v4l2loopback

    # Add the fake device back
    sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1

    echo 'Successfully rebooted My Fake Webcam'
}

KillPort() {
    fuser -k $1/tcp
}

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
alias gampu='GitAddCommitAndPush'
alias editbashrc='nvim ~/Linux-Setup-Scripts/linux/.bashrc'
alias srcbashrc='source ~/.bashrc'
alias reseti3="ResetI3"
alias napifold="NewApiFolder"
alias setupmonitors="sh ~/Linux-Setup-Scripts/scripts/setup_monitors.sh"


GitAddCommitAndPush() {
  git add --all
  git commit -a -m $1
  git push
}

NewApiFolder() {
    mkdir $1
    cd $1
    touch $1Helpers.ts
    touch $1Requests.ts
    touch $1Schema.ts
}

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
    git commit -a -m "Add README.md"j
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

# Export custom prompt
# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# export PS1="\[\033[38;5;41m\]\w\[$(tput sgr0)\]:\[\033[38;5;63m\]\$(parse_git_branch)\[$(tput sgr0)\]$\[$(tput sgr0)\] "

neofetch --ascii_distro mac
eval $(opam config env)
export PATH="$PATH:/Users/andrewpynch/.opam/default/bin/"


alias tmux-sessionizer='~/Linux-Setup-Scripts/scripts/tmux-sessionizer.sh'
bindkey -s '^f' 'tmux-sessionizer\n'

alias tma='tmux attach'
