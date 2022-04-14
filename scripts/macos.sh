#!/usr/bin/env zsh

set -eu

echo -e "\n- Configuring MacOS settings ..."

# Dock
## 自動で隠す
defaults write com.apple.dock autohide -bool true
## Dockのサイズ
defaults write com.apple.dock "tilesize" -int "36"
## 最近起動したアプリを非表示
defaults write com.apple.dock "show-recents" -bool "false"
## Dockが表示されるまでの時間を10秒にする
defaults write com.apple.Dock autohide-delay -float 10;

# スクリーンショット
## スクリーンショットの保存場所をscreenshotsフォルダに変更
if [[ ! -d "$HOME/Pictures/screenshots" ]]; then
    mkdir -p "$HOME/Pictures/screenshots"
fi
defaults write com.apple.screencapture "location" -string "~/Pictures/screenshots"
## スクリーンショット撮影時のサムネイル表示
defaults write com.apple.screencapture "show-thumbnail" -bool "false"
## ファイル名を日付と時刻のみにする
defaults write com.apple.screencapture name ""

# キー入力と文字入力
## キーのリピート速度
defaults write NSGlobalDomain KeyRepeat -int 2
## キーのリピート認識時間
defaults write NSGlobalDomain InitialKeyRepeat -int 15
## 本体キーボードのCapsLockキーの動作をControlにリマップ
keyboard_id="$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)-0"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771300</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>
"
## controlキーとスクロールジェスチャでズーム
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
## 自動で頭文字を大文字にしない 
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool "false"
## スペルの訂正を無効
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool "false"

# Finder
## カラムで表示をデフォルトにする
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"  # unchanged 
## ~/Libraryを表示
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library
## /Volumesを表示
sudo chflags nohidden /Volumes
## 隠しファイルをFinder上で表示
defaults write com.apple.finder AppleShowAllFiles true
## すべての拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## 外観モードをダークに
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
## アクセントカラーをイエローに
defaults write NSGlobalDomain AppleAccentColor -int 2
## 強調表示色をイエローに
defaults write NSGlobalDomain AppleHighlightColor -string '1.000000 0.937255 0.690196'
## クイックルックでのテキスト選択を有効
defaults write com.apple.finder QLEnableTextSelection -bool true

# その他
## タップでクリック
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool "true"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool "true" defaults -currentHost write -g com.apple.mouse.tapBehavior -bool "true"
## バッテリーを%表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"  # unchanged

# TODO
## Finderのよく使う項目に~を追加
## ディスプレイの解像度を「スペースを拡大」に
## 電源まわり
## Spotlight検索と入力ソース切り替えのキーボードショートカットを交代

echo -e "\n- Finished configuring MacOS settings!"
