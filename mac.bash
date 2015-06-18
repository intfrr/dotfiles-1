#!/bin/bash

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/functions.bash)"

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

fancy_echo "Get sudo access once for the rest of the script"
sudo -v

set -e

cd ~

if [ ! -f "$HOME/.zshrc" ]; then
  touch "$HOME/.zshrc"
fi

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -C "al.johri@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/id_rsa"
    pbcopy < "$HOME/.ssh/id_rsa.pub"
    # open https://github.com/settings/ssh
fi

################

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    append_to_zshrc '# recommended by brew doctor'

    # shellcheck disable=SC2016
    append_to_zshrc 'export PATH="/usr/local/bin:$PATH"' 1

    export PATH="/usr/local/bin:$PATH"
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update

brew_tap 'homebrew/dupes' # apps that are all provided b OS X
brew_tap 'homebrew/versions' # multiple versions of existing packages
brew_tap 'homebrew/science' # scientific packages
brew_tap 'homebrew/php' # php related packages
brew_tap 'homebrew/binary' # closed-source packages with only binaries
brew_tap 'caskroom/cask' # gui applications
brew_tap 'caskroom/versions' # multiple versions of existing gui applications
brew_tap 'caskroom/fonts' # fonts

brew_install_or_upgrade 'caskroom/cask/brew-cask'

brew_install_or_upgrade 'openssl'
brew unlink openssl && brew link openssl --force

# [Brew Cask] Essentials
brew_cask_install_or_upgrade 'google-chrome-canary' # bleeding edge daily updates
brew_cask_install_or_upgrade 'google-chrome-dev' # more stable than canary
brew_cask_install_or_upgrade 'firefoxdeveloperedition' # ff developer edition
brew_cask_install_or_upgrade 'logitech-control-center' # to program mouse butons
brew_cask_install_or_upgrade 'logitech-unifying' # for mouse + keyboard
brew_cask_install_or_upgrade 'sizeup' # snap windows by mouse
brew_cask_install_or_upgrade 'cinch' # control window placement via hotkeys
brew_cask_install_or_upgrade 'iterm2-nightly' # terminal emulator
brew_cask_install_or_upgrade 'sublime-text3' # code editor
brew_cask_install_or_upgrade 'atom' # another code editor
brew_cask_install_or_upgrade 'the-unarchiver' # better unarchiving tool
brew_cask_install_or_upgrade 'evernote' # note taker
brew_cask_install_or_upgrade 'insync' # sync google drive documents
brew_cask_install_or_upgrade 'dropbox' # sync files
brew_cask_install_or_upgrade 'skype' # video chat
brew_cask_install_or_upgrade 'google-hangouts' # also video chat
brew_cask_install_or_upgrade 'slack' # team communication
brew_cask_install_or_upgrade 'mailbox' # mail app from dropbox with gestures
brew_cask_install_or_upgrade 'spotify' # streaming music player
brew_cask_install_or_upgrade 'vlc' # video player
brew_cask_install_or_upgrade 'caffeine' # prevent computer from going to sleep
brew_cask_install_or_upgrade 'calibre' # ebook manager
brew_cask_install_or_upgrade 'xtrafinder' # CMD-X for cut
brew_cask_install_or_upgrade 'chromecast'
brew_cask_install_or_upgrade 'fluid'
brew_cask_install_or_upgrade 'goofy' # facebook chat

# [Brew Cask] Development
brew_cask_install_or_upgrade 'virtualbox' # virtual os / emulators
brew_cask_install_or_upgrade 'vagrant' # package virtual envs for development
brew_cask_install_or_upgrade 'sequel-pro' # mysql gui
brew_cask_install_or_upgrade 'google-refine' # dedupe datasets
brew_cask_install_or_upgrade 'macfusion' # use sublime via ssh (sshfs)
# brew_cask_install_or_upgrade 'genymotion' # android emulator
# brew_cask_install_or_upgrade 'andy' # another android emulator
brew_cask_install_or_upgrade 'arduino'
brew_cask_install_or_upgrade 'java' # jdk
brew_cask_install_or_upgrade 'weka'
brew_cask_install_or_upgrade 'xquartz'

# [Brew Cask] Other
brew_cask_install_or_upgrade 'android-file-transfer'
brew_cask_install_or_upgrade 'balsamiq-mockups'
brew_cask_install_or_upgrade 'transmission' # torrents
brew_cask_install_or_upgrade 'sabnzbd' # usenet
brew_cask_install_or_upgrade 'airserver'
brew_cask_install_or_upgrade 'licecap' # gif creator
brew_cask_install_or_upgrade 'colloquy' # irc chat client
brew_cask_install_or_upgrade 'haroopad' # markdown editor
brew_cask_install_or_upgrade 'audacity' # audio recording
brew_cask_install_or_upgrade 'karabiner' # faster key strokes
brew_cask_install_or_upgrade 'bartender' # organize your menu bar apps
# brew_cask_install_or_upgrade 'alfred' # spotlight replacement
brew_cask_install_or_upgrade 'cheatsheet'
brew_cask_install_or_upgrade 'ccleaner'
# brew_cask_install_or_upgrade 'lingon-x' # gui for start up services
brew_cask_install_or_upgrade 'seashore' # ms paint
brew_cask_install_or_upgrade 'paintbrush' # another ms paint
brew_cask_install_or_upgrade 'geektool' # rainmeter for mac
brew_cask_install_or_upgrade 'menumeters' # display stats in menu
#   brew_cask_install_or_upgrade 'launchrocket' # control homebrew services
brew_cask_install_or_upgrade 'fritzing' # electrical circuit diagram / breadboard
brew_cask_install_or_upgrade 'flip4mac' # play windows media on mac
brew_cask_install_or_upgrade 'skim' # very nice pdf viewer for note taking

# Personal PVR
# brew_cask_install_or_upgrade 'plex-media-server'
# brew_install_or_upgrade 'sickbeard'
# brew_install_or_upgrade 'couchpotatoserver'
# brew_install_or_upgrade 'headphones'
# brew_launchctl_restart 'sickbeard'
# brew_launchctl_restart 'couchpotatoserver'
# brew_launchctl_restart 'headphones'

# [Brew Cask] Quick Look Plugins
# https://github.com/sindresorhus/quick-look-plugins
brew_cask_install_or_upgrade 'qlcolorcode' # syntax highlighting
brew_cask_install_or_upgrade 'qlstephen'
brew_cask_install_or_upgrade 'qlmarkdown' # markdown
brew_cask_install_or_upgrade 'quicklook-json' # json
brew_cask_install_or_upgrade 'qlprettypatch' # patch files
brew_cask_install_or_upgrade 'quicklook-csv' # csv
brew_cask_install_or_upgrade 'betterzipql' # zip
brew_cask_install_or_upgrade 'webpquicklook'
brew_cask_install_or_upgrade 'suspicious-package' # pkg files
brew_cask_install_or_upgrade 'provisionql'
brew_cask_install_or_upgrade 'cert-quicklook' # certificates

# Misc
brew_install_or_upgrade 'jack'
brew_launchctl_restart 'jack'

# Shells
brew_install_or_upgrade 'bash'
brew_install_or_upgrade 'bash-completion'
brew_install_or_upgrade 'zsh' '--disable-etcdir'

# Command Line Tools
brew_install_or_upgrade 'the_silver_searcher'
brew_install_or_upgrade 'tree'
brew_install_or_upgrade 'vim' '--override-system-vi' '--enable-pythoninterp'
brew_install_or_upgrade 'colordiff' # color plain diff output
brew_install_or_upgrade 'memtester'
brew_install_or_upgrade 'ngrok' # local tunnel
brew_install_or_upgrade 'ack' # search tool like grep, but optimized for programmers
brew_install_or_upgrade 'lynx' # text only browser
brew_install_or_upgrade 'shellcheck'
brew_install_or_upgrade 'moreutils' # cool cmdline utilites like sponge
brew_install_or_upgrade 'wget' '--with-iri'
brew_install_or_upgrade 'pcre' # perl-compatible Regular Expressions
brew_install_or_upgrade 'rename' # Perl-powered file rename script
brew_install_or_upgrade 'watch'
brew_install_or_upgrade 'md5sha1sum'
brew_install_or_upgrade 'pigz' # parallel implementation of gzip
brew_install_or_upgrade 'docker' # containers
brew_install_or_upgrade 'boot2docker' # script to boot docker on mac os x

# Version Control
brew_install_or_upgrade 'svn'
brew_install_or_upgrade 'mercurial'
brew_install_or_upgrade 'git' '--with-pcre' '--with-brewed-curl' '--with-brewed-openssl' '--with-brewed-svn' '--with-gettext'
brew_install_or_upgrade 'tig' # text interface git
brew_install_or_upgrade 'git-flow'
brew_install_or_upgrade 'gh' # or hub??
brew_cask_install_or_upgrade 'sourcetree'

# Homebrew Dupes and GNU Utils
# (temporarly removed to determine which are necessary)
# brew_install_or_upgrade 'coreutils'
# brew_install_or_upgrade 'findutils' '--with-default-names'
# brew_install_or_upgrade 'gnu-sed' '--with-default-names'
# brew_install_or_upgrade 'homebrew/dupes/grep' '--with-default-names'
# brew_install_or_upgrade 'homebrew/dupes/rsync'
# brew_install_or_upgrade 'homebrew/dupes/gdb'
# brew_install_or_upgrade 'homebrew/dupes/bzip2'

# Libraries
brew_install_or_upgrade 'qt' # qt gui framework
brew_install_or_upgrade 'tcl-tk' # another gui framework
brew_install_or_upgrade 'libxml2' '--with-python'
brew_install_or_upgrade 'libxslt'
brew_install_or_upgrade 'ctags'
brew_install_or_upgrade 'reattach-to-user-namespace' # Reattach process (e.g., tmux) to background
brew_install_or_upgrade 'graphviz'
brew_install_or_upgrade 'libyaml'

# Image, Music, Video Libararies
brew_install_or_upgrade 'imagemagick' '--with-fontconfig' '--with-ghostscript' '--with-jp2' '--with-librsvg' '--with-libtiff' '--with-webp'
brew_install_or_upgrade 'lame'
brew_install_or_upgrade 'libogg'
brew_install_or_upgrade 'libvorbis'
brew_install_or_upgrade 'x264'
brew_install_or_upgrade 'libspotify'

# Languages, Compilers, and SDKs
brew_install_or_upgrade 'homebrew/php/php55' '--with-gmp' '--with-postgresql' '--with-phpdbg' '--with-homebrew-openssl' '--with-homebrew-libxslt' '--with-homebrew-curl' '--without-snmp' # php55-xdebug
brew_install_or_upgrade 'homebrew/science/r' #'--with-openblas'
brew_cask_install_or_upgrade 'rstudio' # gui for R
brew_install_or_upgrade 'go' '--cross-compile-all'
brew_install_or_upgrade 'ghc'
brew_install_or_upgrade 'lua' '--with-completion'
brew_install_or_upgrade 'gcc' '--with-all-languages'
brew_install_or_upgrade 'homebrew/dupes/apple-gcc42'
brew_install_or_upgrade 'android-sdk'
brew_cask_install_or_upgrade 'android-studio' # gui for android development

# Databases and Document Stores
brew_install_or_upgrade 'mysql' # '--enable-memcached' https://github.com/Homebrew/homebrew/issues/33448
brew_install_or_upgrade 'postgresql' '--with-python' # sql database
brew_install_or_upgrade 'sqlite' '--with-functions' # sql datbase
brew_install_or_upgrade 'mongodb' '--with-openssl' # nosql document store
brew_install_or_upgrade 'redis' # in memory key value data store
brew_install_or_upgrade 'elasticsearch' # document search based on lucene
brew_install_or_upgrade 'solr' # document search based on lucene
brew_install_or_upgrade 'memcached'
brew_install_or_upgrade 'rabbitmq' # message queue / broker
brew_install_or_upgrade 'rabbitmq-c' # message queue / broker

brew_launchctl_restart 'mysql'
brew_launchctl_restart 'postgresql'
brew_launchctl_restart 'mongodb'
brew_launchctl_restart 'redis'
brew_launchctl_restart 'elasticsearch'
brew_launchctl_restart 'memcached'
brew_launchctl_restart 'rabbitmq'

# Heroku
brew_install_or_upgrade 'heroku-toolbelt'
heroku plugins:install https://github.com/heroku/heroku-repo.git
heroku plugins:install git://github.com/ddollar/heroku-config.git

fancy_echo "Brew Cleanup, Prune"
brew cleanup
brew prune

################

# zsh + ohmyzsh

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

mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
if [ ! -f "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package" ]; then
  # http://stackoverflow.com/questions/19529999/add-package-control-in-sublime-text-3-through-the-command-line
  fancy_echo "Installing Sublime Text 3 Package Manager"
  wget https://sublime.wbond.net/Package%20Control.sublime-package -P "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/"
  ln -fs "$(pwd)/templates/Package Control.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
fi

append_to_zshrc 'source ~/.commonrc'

################

# Node

brew uninstall --force node

brew_install_or_upgrade 'nvm'

node_version="0.12.4"
mkdir -p "$HOME/.nvm"
cp "$(brew --prefix nvm)/nvm-exec" "$HOME/.nvm/"
source "$(brew --prefix nvm)/nvm.sh"
nvm install "$node_version"
fancy_echo "Setting $node_version as the global default nodejs..."
nvm alias default "$node_version"

################

# Ruby

brew uninstall --force ruby

brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'ruby-build'

ruby_version="2.2.2"
eval "$(rbenv init -)"

if ! rbenv versions | grep -Fq "$ruby_version"; then
  rbenv install -s "$ruby_version"
fi

rbenv global "$ruby_version"
rbenv shell "$ruby_version"

gem update --system

gem_install_or_update 'bundler'

fancy_echo "Configuring Bundler ..."
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

rbenv rehash

################

# Python

brew uninstall --force python

brew_install_or_upgrade 'pyenv'
brew_install_or_upgrade 'pyenv-virtualenvwrapper'

python_version="2.7.10"
eval "$(pyenv init -)"

if ! pyenv versions | grep -Fq "$python_version"; then
  pyenv install -s "$python_version"
fi

pyenv global "$python_version"
pyenv shell "$python_version"

pip install --upgrade pip
pip install virtualenv
pip install virtualenv-clone
pip install virtualenvwrapper
pip install pygments

# Additional Python Dependencies

# pygame
brew_install_or_upgrade 'sdl'
brew_install_or_upgrade 'sdl_image'
brew_install_or_upgrade 'sdl_mixer'
brew_install_or_upgrade 'sdl_ttf'
brew_install_or_upgrade 'portmidi'
pip install hg+http://bitbucket.org/pygame/pygame#egg=pygame

# sip
if [ $(python -c 'import sip' 2>/dev/null && echo "1" || echo "0") -eq 0 ]; then
  cd ~; wget http://sourceforge.net/projects/pyqt/files/sip/sip-4.16.8/sip-4.16.8.tar.gz
  tar -xvf sip-4.16.8.tar.gz
  cd sip-4.16.8; python configure.py; make; make install
  cd ~; rm sip-4.16.8.tar.gz; rm -rf sip-4.16.8
fi

# pyqt
if [ $(python -c 'import PyQt4' 2>/dev/null && echo "1" || echo "0") -eq 0 ]; then
  cd ~; wget http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.4/PyQt-mac-gpl-4.11.4.tar.gz
  tar -xvf PyQt-mac-gpl-4.11.4.tar.gz
  cd PyQt-mac-gpl-4.11.4; python configure.py --confirm-license; make; make install
  cd ~; rm PyQt-mac-gpl-4.11.4.tar.gz; rm -rf PyQt-mac-gpl-4.11.4
fi

pip install --upgrade numpy
pip install --upgrade scipy
pip install --upgrade scikit-learn
pip install --upgrade nltk
pip install --upgrade "ipython[notebook]"
pip install --upgrade matplotlib
pip install --upgrade requests
pip install --upgrade pygments
pip install --upgrade lxml
pip install --upgrade rodeo

pyenv rehash

python -m nltk.downloader all

################

# From https://github.com/mathiasbynens/dotfiles/blob/master/.osx

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

fancy_echo "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

fancy_echo "Trackpad: map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

fancy_echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

fancy_echo "Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
fancy_echo "Follow the keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

fancy_echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

fancy_echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0

fancy_echo "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

fancy_echo "Set Desktop as the default location for new Finder windows"
fancy_echo "For other paths, use PfLo and file:///full/path/here/"
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

fancy_echo "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

fancy_echo "Privacy: don’t send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

fancy_echo "Press Tab to highlight each item on a web page"
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

fancy_echo "Show the full URL in the address bar (note: this still hides the scheme)"
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

fancy_echo "Set Safari’s home page to about:blank for faster loading"
defaults write com.apple.Safari HomePage -string "about:blank"

fancy_echo "Prevent Safari from opening ‘safe’ files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

fancy_echo "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true


###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

fancy_echo "Enable the debug menu in Address Book"
defaults write com.apple.addressbook ABShowDebugMenu -bool true

fancy_echo "Enable Dashboard dev mode (allows keeping widgets on the desktop)"
defaults write com.apple.dashboard devmode -bool true

fancy_echo "Enable the debug menu in iCal (pre-10.8)"
defaults write com.apple.iCal IncludeDebugMenu -bool true

fancy_echo "Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0
fancy_echo "Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

fancy_echo "Enable the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true


###############################################################################
# Mac App Store                                                               #
###############################################################################

fancy_echo "Enable the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

fancy_echo "Enable Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true


###############################################################################
# Finder                                                                      #
###############################################################################

fancy_echo "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

fancy_echo "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

fancy_echo "Finder: allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

fancy_echo "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

###############################################################################
# Transmission.app                                                            #
###############################################################################

fancy_echo "Don’t prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

fancy_echo "Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

fancy_echo "Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false
fancy_echo "Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

fancy_echo "Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

fancy_echo "Set the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36

fancy_echo "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true


###############################################################################
# SizeUp.app                                                                  #
###############################################################################

fancy_echo "Start SizeUp at login"
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

fancy_echo "Don’t show the preferences window on next start"
defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false

###############################################################################
# iTerm2.app                                                                  #
###############################################################################

defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
	"Transmission" "Twitter" "iCal" "iTerm2"; do
	killall "${app}" > /dev/null 2>&1 && echo "${app} killed" || echo "${app} not running"
done
