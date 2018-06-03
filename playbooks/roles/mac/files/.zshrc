#config homebrew
export HOMEBREW=${HOME}/.homebrew
export PATH=${HOMEBREW}/bin:${PATH}
export PYTHONPATH=${HOMEBREW}/lib/python:${PYTHONPATH}

#単語区切り定義
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#補間
autoload -U compinit
compinit

#文字コード
export LANG=ja_JP.UTF-8

#プロンプト
autoload colors
colors

PROMPT="
 %{${fg[yellow]}%}%~%{${reset_color}%} 
[%n]$ "

PROMPT2='[%n]> ' 

#履歴
#履歴を保存するファイル指定
HISTFILE="$HOME/.zsh_history"

#履歴の件数
HISTSIZE=100000
SAVEHIST=100000

#モジュール
zmodload zsh/mathfunc

#==============================================
#オプション
#==============================================

#重複した履歴を保存しない
setopt hist_ignore_dups

#履歴を共有する
setopt share_history

#先頭にスペースを入れると履歴に残さない
setopt hist_ignore_space

#ディレクトリ名だけで移動する。
setopt auto_cd

#自動でpushdする
setopt auto_pushd

#pushdの履歴は残さない。
setopt pushd_ignore_dups

#ビープ音ならなさない
setopt nobeep

#ls結果を見やすくする
setopt listpacked

#大小文字を区別させない
unsetopt caseglob

#command typo修正の提示文を表示
setopt correct_all

#==============================================

#履歴の検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

#ターミナルのタイトル
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
esac 

#色の設定
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

#w3mでALC検索
function alc() {
  if [ $# != 0 ]; then
    w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
  else
    w3m "http://www.alc.co.jp/"
  fi
}

#login
sshlogin() { python ~/Work/toolbox/ntp/auto-ssh-login.py -p $1 }

#エディタ
export EDITOR=vim

#改行のない出力をプロンプトで上書きするのを防ぐ
unsetopt promptcr

#個別設定を読み込む
[ -f ~/.zshrc.work ] && source ~/.zshrc.work
[ -f ~/.zshrc.home ] && source ~/.zshrc.home
[ -f ~/.zshenv.work ] && source ~/.zshenv.work
[ -f ~/.zshenv.home ] && source ~/.zshenv.home

#==============================================
#キーバインド
#==============================================
bindkey -e

#zshのdeleteキーを削除にする
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

#==============================================
#alias
#==============================================

#拡張子関連つけ
alias -s log=cat
alias -s php=vim

#コマンド短縮
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac

#ssh-agentを複数仮想端末で使えるようにする
[ -e "${HOME}/.ssh/agent-env" ] && . "${HOME}/.ssh/agent-env"


alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias grep='egrep'

#reload zshrc
alias rezsh='source ~/.zshrc && source ~/.zshenv'

#clear vimbackup
alias clvim='rm ~/vimbackup/*.*'

#correct_all On になっているので
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

#global option
alias -g L="|less"
alias -g M="|more"
alias -g H="|head"
alias -g T="|tail"
alias -g G="|grep"

#the silver searcher
alias ag="ag --pager 'less -R'"

#git
alias gst="git status --ignore-submodules=dirty"
alias ggr="git grep"
alias gsh="git stash"
alias gsp="git stash pop"
alias gad="git add"
alias gct="git checkout"
alias gbr="git branch"
alias gsw="git show"
alias gco="git commit"
alias gcoa="git commit -a -m"
alias gpl="git pull --rebase"
alias gps="git push"
alias glog="git log -n"
alias glogt="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias glogp="git log --graph --date=short --pretty=format:'%Cgreen%h %cd %Cblue%cn %Creset%s'"
alias glogst="git log --stat -n"
alias glogdiff="git log -p --full-diff"
alias gwc="git whatchanged -n"
alias gdi="git diff"
alias gch="git cherry"
alias grS="git reset --soft"
alias grM="git reset"
alias grH="git reset --hard"
alias gd1="git diff HEAD~"
alias gd2="git diff HEAD~~"
alias gd3="git diff HEAD~~~"
alias gd4="git diff HEAD~~~~"
alias gd5="git diff HEAD~~~~~"
alias gd6="git diff HEAD~~~~~~"
alias gd7="git diff HEAD~~~~~~~"
alias gd8="git diff HEAD~~~~~~~~"
alias gd9="git diff HEAD~~~~~~~~~"
alias gd10="git diff HEAD~~~~~~~~~~"
alias git-new-workdir="sh ~/toolbox/git-new-workdir"
alias gpx="git log --pretty=oneline --abbrev-commit -S"
gdbgrep() { git branch -D `git branch | grep $1 | xargs` }

alias -g O="--oneline"
alias -g C="--cached"
alias -g S="--stat"

#screen
alias sc="screen"
alias scl="screen -ls"
alias scd="screen -d"
alias scr="screen -r"

#irssi
alias irssi='env TERM=screen-256color irssi'

#php
alias tlog='tail -f /var/log/php.log'
alias vlog='vi /var/log/php.log'

#python
alias py32='VERSIONER_PYTHON_PREFER_32_BIT=yes /usr/bin/python'
alias runskypebot='py32 ~/Dropbox/GREE/cli/skypebot.py'

#emacs
alias em='emacs-23.3'

#pip for python 2.7
alias pip2='/usr/local/bin/pip'

#wayterm
alias wayterm='~/Work/wayterm/wayterm'

#sudo
alias sudophpunit='sudo env PATH=$PATH phpunit'

#stop correct
alias td='nocorrect td'

#tmux
#alias tmux='tmux attach-session'
#==============================================

#use 256 color
eval `tset -sQ xterm-256color`

#show git branch/status
#=============================================
setopt prompt_subst
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
     color=%F{red}
  fi
  echo "$color$name$action%f%b "
}

RPROMPT='`rprompt-git-current-branch`'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#go
GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin # Add GOPATH/bin

#goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

livet() { echo $SL_REGION | livetail -i $SL_ACCESS_ID -k $SL_ACCESS_KEY $@ }

###-tns-completion-start-###
if [ -f /Users/nerocrux/.tnsrc ]; then
    source /Users/nerocrux/.tnsrc
fi
###-tns-completion-end-###
