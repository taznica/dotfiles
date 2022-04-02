# zsh options ###############################################################################

HISTFILE=$ZDOTDIR/.zsh_history  # 履歴ファイル.zsh_historyの保存先を~/.zsh.dに設定
setopt SHARE_HISTORY  # セッション間で履歴ファイルを共有
setopt HIST_IGNORE_DUPS  # 同じコマンドが連続した時は履歴に残さない
setopt AUTO_CD  # cdコマンドなしでディレクトリを移動
setopt AUTO_PUSHD  # cdでTabキーを押した時にdir listを表示
setopt CORRECT  # コマンドにスペルミスがある時に候補を表示
setopt GLOBDOTS  # .なしでも.から始まるファイルをdir listに表示

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別しない（大文字を入力した場合は区別する）
zstyle ':completion:*:default' menu select=1  # 補完の候補一覧でTabキーで選択できるようにする

## zsh-completions (compinitの定義ファイルを拡張するプラグイン)
## https://github.com/zsh-users/zsh-completions
## $ brew install zsh-completions
fpath+=/opt/homebrew/share/zsh-completions  # zsh-completionsへのパスを追加
autoload -Uz compinit; compinit  # 補完機能を初期化・実行
## $ rm -f ~/.zcompdump; compinit
## $ source .zshrc
## warningが出るため、$ compaudit で問題のあるディレクトリを確認
## $ chmod -R go-w '/opt/homebrew/share'

compinit -d $ZDOTDIR/.zcompdump  # compinitのダンプファイル.zcompdumpの保存先を~/.zsh.dに設定

## zsh-autosuggestions (コマンド候補を表示し入力補完するプラグイン)
## https://github.com/zsh-users/zsh-autosuggestions
## $ brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh  # zsh-autosuggestionsを読み込む

## 色を定義 (TerminalのプロファイルSmyckと同じ)
export LSCOLORS=exfxcxdxbxGxDxabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}  # lsと同様に補完候補にも色を付ける

## グループ分けして補完表示
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes


# prompt (pure) #############################################################################

## https://github.com/sindresorhus/pure 
## $ brew install pure

fpath+=/opt/homebrew/share/zsh/site-functions  # pureへのパスを追加
autoload -Uz promptinit; promptinit  # プロンプトを初期化・実行
PURE_PROMPT_SYMBOL="$"  # シンボルを設定

## 色を設定
zstyle :prompt:pure:path color yellow
zstyle :prompt:pure:prompt:error color magenta
zstyle :prompt:pure:prompt:success color white
zstyle :prompt:pure:execution_time color blue

prompt pure  # pureをプロンプトに設定


# PATH ######################################################################################

export PATH=/usr/local/bin/git:$PATH  # Git (Homebrew)


# aliases ###################################################################################

alias ls='ls -GF'  # 色付き・ファイルタイプ識別子付きで表示
alias la='ls -GFa'  # 隠しファイルも表示
