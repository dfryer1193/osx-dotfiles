setopt NO_CASE_GLOB
setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

if [[ -e $HOME/.workrc ]] {
  source .workrc
}

alias ls='ls -lvhBFG'
alias tree='tree -C'
alias plz='sudo $(fc -ln -1)'
if $(type nvim &>/dev/null) ; then
  alias vim='nvim'
  alias vimdiff='nvim -d'
  alias vimwiki='nvim -c "VimwikiIndex"'
  alias today='nvim -c "VimwikiMakeDiaryNote"'
  alias vw='vimwiki'
  alias vwt='today'
  alias vwi='nvim -c "VimwikiDiaryIndex"'
else
  alias vimwiki='vim -c "VimwikiIndex"'
  alias vw='vimwiki'
fi
alias gti='git'

function intellij() {
  /Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea $(realpath $1) &> /dev/null & disown
}

# Turn on tab completion
autoload -Uz compinit && compinit
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix

# Set the window title
function precmd() { echo -ne "[\033]2;${PWD/#"$HOME"/~}\007]" }

# Git status courtesy of https://github.com/woefe/git-prompt.zsh
export ZSH_GIT_PROMPT_SHOW_STASH=1
source $HOME/.zsh/git-prompt.zsh/git-prompt.zsh
source $HOME/.zsh/git-prompt.zsh/examples/mine.zsh
PROMPT='%B%(?.%F{green}[%F{white}.%F{red}[)%b%~%B%(?.%F{green}].%F{red}])%F{white}%b$(gitprompt) '
