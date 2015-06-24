# historyファイルを上書きせずに追記する.
shopt -s histappend

# colorの設定
# 0部分を1にするとBold, 4にするとUnderline, 5にするとBackground
clblack='\e[0;30m'  # Black
clred='\e[0;31m'    # Red
clgreen='\e[0;32m'  # Green
clyellow='\e[0;33m' # Yellow
clblue='\e[0;34m'   # Blue
clpurple='\e[0;35m' # Purple
clcyan='\e[0;36m'   # Cyan
clwhite='\e[0;37m'  # White
clend='\e[0m'	    # Color End(色の終わりを示す)

# プロンプトの設定
# ユーザ名@ホスト名:カレントディレクトリ(色:Green)
PS1="$clgreen[\u@\h:\w]\$ $clend"

# キーバインドの設定
bind "\C-l":backward-char	
bind "\C-j":clear-screen

# エイリアスの設定
if [ $OSTYPE = "Darwin" ]; then
    if [ -e ~/.shell_alias.macos ]; then
	source ~/.shell_alias.macos
    fi
elif [ $OSTYPE = "Linux" ]; then
    if [ -e ~/.shell_alias.linux ]; then
	source ~/.shell_alias.linux
    fi
fi


# bash-completionがある場合は補完機能を強化する. 
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
