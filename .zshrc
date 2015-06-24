# OSタイプの取得
TYPE_OF_OS=`uname`

# プロンプトの設定
PROMPT="%F{green}[%n@%M]%(!.#.$) %f"
RPROMPT="%F{green}[%~]%f"

# エイリアスの設定
if [ $TYPE_OF_OS = "Darwin" ]; then 
    if [ -e ~/.shell_alias.macos ]; then
	source ~/.shell_alias.macos
    fi
elif [ $TYPE_OF_OS = "Linux" ]; then
    if [ -e ~/.shell_alias.linux ]; then
	source ~/.shell_alias.linux
    fi    
fi


# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 

# キーバインドの設定
bindkey "^J" clear-screen
bindkey "^L" backward-char
bindkey "^O" push-input
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward

# 補完の設定(/etc/zshrcに書いてある)
autoload -U compinit
compinit

# ディレクトリ名を入力するだけでそのディレクトリに移動
setopt auto_cd 

# 移動したディレクトリを記録
setopt auto_pushd

# 入力したコマンド名が間違っている場合には修正
#setopt correct 

# 補完候補を詰めて表示
#setopt list_packed

# 補完時に音がならないようにする
setopt nolistbeep

# 補完の時に大文字小文字を区別しない
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#
#これを設定すると pkgsとPKGSをpとPの一文字で補完できない
#うっとうしいのでコメントアウトする.

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# の方が、大文字の場合は小文字を補完しないのでお薦めです。
# (わざわざ大文字打ったのだから
# 小文字を補完する必要はないだろう)

# google
function google() {
  local str opt 
  if [ $# != 0 ]; then # 引数が存在すれば
    for i in $*; do
      str="$str+$i"
    done    
    str=`echo $str | sed 's/^\+//'` #先頭の「+」を削除
    opt='search?num=50&hl=ja&ie=utf8&oe=utf-8&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  #w3m http://www.google.co.jp/$opt #引数がなければ $opt は空になる
  # mozilla -remote openURL\(http::/www.google.co.jp/$opt\) # 未テスト
  firefox -remote openURL\(http://www.google.co.jp/$opt\) # 未テスト
}

# emacsのM-x shellでzshを使う
[[ $EMACS = t ]] && unsetopt zle

# 豊富なグロッピング機能を使う
# hoge.c以外のソースファイルを消去する．rm *.c~hoge.c
setopt EXTENDED_GLOB

# 補完候補の詳細表示
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''


# EDITORの設定
export EDITOR=/usr/bin/vim


