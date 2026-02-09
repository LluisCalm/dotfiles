if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin
ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH CONFIG
DISABLE_AUTO_TITLE="true"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  z 
  vscode
  git
  ubuntu
  docker
  ufw
  git-extras
  github
  docker-compose
  kubectl
  aws
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  termtitle
  command-not-found
  zsh-interactive-cd
  fzf
  terraform)
zstyle ':zim:termtitle' format '%1~'
source $ZSH/oh-my-zsh.sh

# USEFUL ALIAS
alias lz=lazygit
alias codew="code -r ."
alias cat="batcat -pp"
alias ls="lsd"
# KUBERNETES ALIAS
alias ktx=kubectx
alias kns=kubens
alias wpods="watch -n1 kubectl get pods"
alias wsvc="watch -n1 kubectl get svc"
alias wpvc="watch -n1 kubectl get pvc"
alias wnodes="watch -n1 kubectl get nodes"

# FUNCTIONS
function encode() {
  input=${1:-$(</dev/stdin)}
  if [ -z "$input" ]; then
    echo "Usage: encode <string>"
    return 1
  fi
  echo -n "$input" | sed 's/==$/=/g' | base64
}

function decode() {
  input=${1:-$(</dev/stdin)}
  if [ -z "$input" ]; then
    echo "Usage: decode <base64_string>"
    return 1
  fi
  echo -n "$input" | base64 -d
}

function jwtd() {
  if [[ -x $(command -v jq) ]]; then
	jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "${1}"
    echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
  fi
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/flutter/bin:$PATH"
