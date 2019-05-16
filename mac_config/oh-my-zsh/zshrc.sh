ZSH=$HOME/.oh-my-zsh

if [[ ! -d ~/.antigen ]]; then
    git clone -b master https://github.com/zsh-users/antigen.git ~/.antigen
fi

if [ ! -d ~/tools/Command-Line-Youdao-Dictionary ]; then
    git clone https://github.com/qhwa/Command-Line-Youdao-Dictionary.git \
        ~/tools/Command-Line-Youdao-Dictionary
fi

source ~/.antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
git
git-extras
common-aliases
python
extract
z

zsh-users/zsh-syntax-highlighting
zsh-users/zsh-autosuggestions
Tarrasch/zsh-autoenv
supercrabtree/k
zsh-users/zsh-history-substring-search

# pure
mafredri/zsh-async
sindresorhus/pure
EOBUNDLES


antigen apply

export SHELL=/bin/zsh
export EDITOR=vim

bindkey -e

##############################################################################
# alias
##############################################################################

alias md5sum="md5 -r"


function gdf {
    git diff --color $1 | diff-so-fancy | less --tabs=1,5 -RFX
}
function copy-file-contents() {
    cat $1 | pbcopy
    echo "-- '$1' copied to the clipboard! --"
}


alias vimzshrc="vim ~/.zshrc; source ~/.zshrc"
alias vimvimrc='vim ~/.vimrc'
alias vimtmux="vim ~/.tmux.conf"

alias yd='~/apps/Command-Line-Youdao-Dictionary/dict'
alias dnsflush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; say DNS cache flushed；'
alias myip="echo `ifconfig en4 |grep 10.236|awk '{print $2}'`"
alias pyvenv='virtualenv -p python3 venv'
alias pyweb='myip ; sudo python -m SimpleHTTPServer 80'
export PATH="/usr/local/opt/openssl/bin:$PATH"

##############################################################################
# User configuration
##############################################################################

export LC_CTYPE=en_US.UTF-8

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=159"

function peco-select-history() {
    local tac="tail -r"
    BUFFER=$(\history -n 1 | tail -r | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-git-branch-checkout () {
    local selected_branch_name="$(git branch -a | peco | tr -d ' ')"
    case "$selected_branch_name" in
        *-\>* )
            selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*->(.*?)\/(.*)$/\2/;print')";;
        remotes* )
            selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*?remotes\/(.*?)\/(.*)$/\2/;print')";;
    esac
    if [ -n "$selected_branch_name" ]; then
        BUFFER="git checkout ${selected_branch_name}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-branch-checkout
bindkey '^q' peco-git-branch-checkout
