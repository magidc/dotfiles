
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-autopair zsh-completions extract sudo colored-man-pages cd-ls update-custom-plugins aws gcloud zsh-random-quotes copybuffer web-search dirhistory alias-tips mvn poetry zoxide)

export ZSH_HIGHLIGHT_MAXLENGTH=10

source $ZSH/oh-my-zsh.sh

# FZF
source $HOME/.fzf-config.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable vi mode
# set -o vi
# bindkey -v

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LANGUAGE=$LANG

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='vim'
 fi

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
#
neofetch
nerd

# Autostart tmux
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux attach -t aui
#fi

# Custom color schemes for LS highlight
eval "$(dircolors ~/.dircolors)";

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To be used with an alias
copyFilePath(){
	readlink -f $1 | xclip -selection c
}

commitPush(){
  git add --all; git commit -m $1; git push origin
}

function expand-alias() {
	zle _expand_alias
  zle backward-delete-char
}

zle -N expand-alias
bindkey -M emacs '^z' expand-alias
bindkey -M vicmd '^z' expand-alias
bindkey -M viins '^z' expand-alias

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30

## Custom binding for kill -9 ** assited with fzf
# bindkey '^i' 'kill -9 ** autosuggest-accept'

# CD-LS config
export CDLS_COMMAND='exa --icons'

# >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Brot file manager
source $HOME/.config/broot/launcher/bash/br

getHome() {
  LBUFFER+=" $HOME/"
}

zle     -N             getHome
bindkey -M emacs '\e;'  getHome
bindkey -M vicmd '\e;'  getHome
bindkey -M viins '\e;'  getHome

getKill() {
    local proc
    proc=$(fzf -m --header-lines=1 --preview 'echo {}' --preview-window down:3:wrap --min-height 15 --height ${FZF_TMUX_HEIGHT:-40%} --reverse -- "$@" < <(
    command ps -eo user,pid,ppid,start,time,command 2> /dev/null ||
      command ps -eo user,pid,ppid,time,args # For BusyBox
      )
    )
    if [[ -n "$proc" ]]; then
      echo "$proc" | awk '{print $2}' | xargs kill -9
      echo "Killed process $(echo "$proc" | awk '{print $6}')"
    else
      echo "No process selected"
    fi
    zle accept-line
}

zle     -N             getKill
bindkey -M emacs '\ek'  getKill
bindkey -M vicmd '\ek'  getKill
bindkey -M viins '\ek'  getKill


# Copy command that creates destination directory if it doesn't exist
cpmk() { 
  mkdir -p `dirname $2` && cp "$1" "$2"; 
}
