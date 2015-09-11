#!/bin/bash

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/functions.bash)"

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

fancy_echo "Get sudo access once for the rest of the script"
sudo -v

set -e

cd ~

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/brew.sh)"
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/apps.sh)"

fancy_echo "Brew Cleanup, Prune"
brew cleanup
brew prune

################

# zsh + ohmyzsh

# Shells
brew_install_or_upgrade 'bash'
brew_install_or_upgrade 'bash-completion'
brew_install_or_upgrade 'zsh' '--without-etcdir'

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  curl -L http://install.ohmyz.sh | sh
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
  # brew_install_or_upgrade 'zsh-completions'
  append_to_zshrc 'plugins+=(zsh-completions)'
  append_to_zshrc 'autoload -U compinit && compinit'
fi

SHELLS_FILE=$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/templates/shells)

if [ "x$SHELLS_FILE" != "x$(cat /etc/shells)" ]; then
  fancy_echo "Copy custom /etc/paths to allow for homebrew installed shells"
  sudo sh -c "echo '$SHELLS_FILE' > /etc/shells"
fi

REALSHELL=$(dscl . -read "/Users/$USER/" UserShell | awk '{ print $2 }')

if [ "$REALSHELL" != "/usr/local/bin/zsh" ]; then
    fancy_echo "Switch to /usr/local/bin/zsh instead of /bin/zsh"
    fancy_echo "Changing your $REALSHELL shell to /usr/local/bin/zsh ..."
    chsh -s "$(which zsh)"
fi

################

# Clone and Symlink Dotfiles

cd "$HOME"

if [ ! -d "$HOME/dotfiles" ]; then
  fancy_echo "Cloning dotilfes into home directory"
  git clone git@github.com:AlJohri/dotfiles.git
fi

cd dotfiles

fancy_echo "Symlinking various configuration files into home directory"
ln -fs "$(pwd)/templates/commonrc" ~/.commonrc
ln -fs "$(pwd)/templates/vimrc" ~/.vimrc
ln -fs "$(pwd)/templates/gitconfig" ~/.gitconfig
ln -fs "$(pwd)/templates/gemrc" ~/.gemrc
ln -fs "$(pwd)/templates/gitignore" ~/.gitignore
ln -fs "$(pwd)/templates/agignore" ~/.agignore
ln -fs "$(pwd)/templates/gitignore_global" ~/.gitignore_global

mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
if [ ! -f "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package" ]; then
  # http://stackoverflow.com/questions/19529999/add-package-control-in-sublime-text-3-through-the-command-line
  fancy_echo "Installing Sublime Text 3 Package Manager"
  wget https://sublime.wbond.net/Package%20Control.sublime-package -P "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/"
  ln -fs "$(pwd)/templates/Package Control.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
fi

append_to_zshrc 'source ~/.commonrc'

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/osx.sh)"

###############################################################################
# Kill affected applications                                                  #
###############################################################################

# remove iTerm2 from killed applications
# "iTerm2"

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
	"Transmission" "Twitter" "iCal"; do
	killall "${app}" > /dev/null 2>&1 && echo "${app} killed" || echo "${app} not running"
done
