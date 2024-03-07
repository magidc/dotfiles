# FZF config
# export FZF_CTRL_T_OPTS="--preview 'cat {}'"
# export FZF_CTRL_Y_OPTS="--preview 'cat {}'"
export FZF_DEFAULT_COMMAND='fdfind --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fdfind --follow --exclude .git'
#export FZF_CTRL_T_COMMAND='fdfind --type f --follow --exclude .git'
export FZF_CTRL_Q_COMMAND='fdfind --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fdfind --type d --follow --exclude .git . $HOME'
export FZF_ALT_H_COMMAND='fdfind --type d -d1 --follow --exclude .git . $HOME'
export FZF_ALT_V_COMMAND='fdfind --type d --hidden --follow --exclude .git'
## Must create and maintain ".project" file with a plain list of paths to your project directories
export FZF_PROJECTS_FILE_PATH='$HOME/.projects'


## Custom binding CTRL-q - Paste the selected file path(s) into the command line
__fselhidden() {
  local cmd="${FZF_CTRL_Q_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_CTRL_Q_OPTS-}" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  return $ret
}

fzf-file-hidden-widget() {
  LBUFFER="${LBUFFER}$(__fselhidden)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N            fzf-file-hidden-widget
bindkey -M emacs '^q' fzf-file-hidden-widget
bindkey -M vicmd '^q' fzf-file-hidden-widget
bindkey -M viins '^q' fzf-file-hidden-widget

## Custom binding ALT-v - cd into the selected subdirectory of current location
fzf-cd-subdir-widget() {
  local cmd="${FZF_ALT_V_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_ALT_V_OPTS-}" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="builtin cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N             fzf-cd-subdir-widget
bindkey -M emacs '\ev' fzf-cd-subdir-widget
bindkey -M vicmd '\ev' fzf-cd-subdir-widget
bindkey -M viins '\ev' fzf-cd-subdir-widget


## Custom binding ALT-h - cd into the home first level subdirectories
fzf-cd-home-subdir-widget() {
  local cmd="${FZF_ALT_H_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_ALT_V_OPTS-}" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="builtin cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N             fzf-cd-home-subdir-widget
bindkey -M emacs '\eh' fzf-cd-home-subdir-widget
bindkey -M vicmd '\eh' fzf-cd-home-subdir-widget
bindkey -M viins '\eh' fzf-cd-home-subdir-widget

## Switch to recent locations with Z
### Z plugins must be installed. If using .oh-my-zsh add this to .zshrc: plugins=(z)
fzf-z-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "sort -t'|' -nrk3 ${ZSHZ_DATA:-$HOME/.z} | awk -F '|' '{print \$1}'" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-}" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="builtin cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
# zle     -N             fzf-z-widget
# bindkey -M emacs '\ez' fzf-z-widget
# bindkey -M vicmd '\ez' fzf-z-widget
# bindkey -M viins '\ez' fzf-z-widget

## Switch to root directory of the project or to the parent directory if not in a project
fzf-root-widget() {
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="cd ${CURRENT_PROJECT:--}"
  zle accept-line
}
zle     -N             fzf-root-widget
bindkey -M emacs '\ez' fzf-root-widget
bindkey -M vicmd '\ez' fzf-root-widget
bindkey -M viins '\ez' fzf-root-widget

## Custom binding ALT-x - Select item from clipboard
#### To use with GNOME extension "Clipboard indicator"
_fzf-item_clipboard() {
  local items=("${(@f)$(jq '.[].contents' $HOME/.cache/clipboard-indicator@tudmotu.com/registry.txt)}")
  local list=""
  for i in "${items[@]}" 
  do 
    local str="${i:1}"
    str=$(sed 's/.\{1\}$//' <<< "$str")
    list="$str"$'\n'"$list"
  done
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  echo $list | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_CTRL_T_OPTS-}" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item}" | xclip -selection c | echo ""
  done
  local ret=$?
  echo
  return $ret
}

fzf-item_clipboard-widget() {
  LBUFFER="${LBUFFER}$(_fzf-item_clipboard)"
  local ret=$?
  zle reset-prompt
  return $ret
}

zle     -N              fzf-item_clipboard-widget
bindkey -M emacs '\ex'  fzf-item_clipboard-widget
bindkey -M vicmd '\ex'  fzf-item_clipboard-widget
bindkey -M viins '\ex'  fzf-item_clipboard-widget

## Switch to project directory
### File ".projects" must be externaly mantained in order to incluse paths to project directories
projects_file_path="${FZF_PROJECTS_FILE_PATH:-"$HOME/.projects"}"

fzf-cd-project-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "cat $projects_file_path" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_ALT_P_OPTS-}" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  export CURRENT_PROJECT="$dir"
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="builtin cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}

add-project(){
  sed -i '$a\'"$1"'' $projects_file_path
}

remove-project(){
  sed -i '/\<sds\>/d' $projects_file_path 
}

zle     -N             fzf-cd-project-widget
bindkey -M emacs '\ep' fzf-cd-project-widget
bindkey -M vicmd '\ep' fzf-cd-project-widget
bindkey -M viins '\ep' fzf-cd-project-widget


