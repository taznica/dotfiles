# Smyckプロファイル
# http://color.smyck.org/
TERMINAL_PROFILE='Smyck'
CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
if [ "${CURRENT_PROFILE}" != "${TERMINAL_PROFILE}" ]; then
    curl -L https://raw.githubusercontent.com/hukl/Smyck-Color-Scheme/master/Smyck.terminal -o ./$TERMINAL_PROFILE.terminal
    open $TERMINAL_PROFILE.terminal
    defaults write com.apple.Terminal "Default Window Settings" -string "$TERMINAL_PROFILE"
    defaults write com.apple.Terminal "Startup Window Settings" -string "$TERMINAL_PROFILE"
    rm ./$TERMINAL_PROFILE.terminal
fi
defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"
