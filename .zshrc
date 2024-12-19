bindkey -v

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="strug"

CASE_SENSITIVE="true"

ENABLE_CORRECTION="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

alias ll='ls -Al'

alias chmox='chmod +x'
alias jou='journalctl -u'
alias stl='systemctl'

alias cal='cal -m'

alias i3lock='i3lock --color=000000'
alias dmenu='dmenu -nb "#000" -nf "#eee" -sb "#0f0" -sf "#00f"'

alias ytdl-mp3='yt-dlp -x --audio-format=mp3 -o "%(title)s.%(ext)s"' 
alias espeak='espeak -v en-us -p 10 -g 5 -s 200'

alias vim='nvim'
alias git='EDITOR=nvim git'
alias gl='git log --oneline --all --graph --decorate $*'
alias gitfc='git fetch && git checkout' 
alias gitdev='git fetch && git checkout dev && git pull'
alias pdf='zathura'

alias mount='sudo mount'
alias umount='sudo umount'

export EDITOR=nvim

