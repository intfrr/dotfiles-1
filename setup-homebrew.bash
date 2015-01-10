#!/usr/bin/env bash

fancy_echo() {
    printf "\n%b\n" "$1"
}

append_to_zshrc() {
    local text="$1" zshrc
    local skip_new_line="$2"

    if [[ -w "$HOME/.zshrc.local" ]]; then
        zshrc="$HOME/.zshrc.local"
    else
        zshrc="$HOME/.zshrc"
    fi

    if ! grep -Fqs "$text" "$zshrc"; then
        if (( skip_new_line )); then
            printf "%s\n" "$text" >> "$zshrc"
        else
            printf "\n%s\n" "$text" >> "$zshrc"
        fi
    fi
}

brew_is_installed() {
    local NAME=$(brew_expand_alias "$1")
    brew list -1 | grep -Fqx "$NAME"
}

brew_is_upgradable() {
    local NAME=$(brew_expand_alias "$1")
    brew outdated --quiet "$NAME" >/dev/null
    [[ $? -ne 0 ]]
}

brew_expand_alias() {
    brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_expand_alias() {
    brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_is_installed() {
    local NAME=$(brew_cask_expand_alias "$1")
    brew cask list -1 | grep -Fqx "$NAME"
}

brew_launchctl_restart() {
    local NAME=$(brew_expand_alias "$1")
    local DOMAIN="homebrew.mxcl.$NAME"
    local PLIST="$DOMAIN.plist"
    mkdir -p ~/Library/LaunchAgents
    ln -sfv /usr/local/opt/$NAME/$PLIST ~/Library/LaunchAgents
    if launchctl list | grep -q $DOMAIN; then
        launchctl unload ~/Library/LaunchAgents/$PLIST >/dev/null
    fi
    launchctl load ~/Library/LaunchAgents/$PLIST >/dev/null
}

brew_install_or_upgrade() {
    if brew_is_installed "$1"; then
        if brew_is_upgradable "$1"; then
            brew upgrade "$@"
        else
            echo "$1 is already installed and is the latest version"
        fi
    else
        brew install "$@"
    fi
}

brew_tap_is_tapped() {
    brew tap | grep -Fqx $1
}

brew_cask_install_or_upgrade() {
    if brew_cask_is_installed "$1"; then
        echo "$1 is already installed, brew cask upgrade is not yet implmented"
    else
        brew cask install --appdir="/Applications" "$@"
    fi
}

brew_tap() {
    if brew_tap_is_tapped "$1"; then
        echo "$1 is already tapped"
    else
        brew tap $1
    fi
}

if ! command -v brew >/dev/null; then
    fancy_echo "Installing Homebrew, a good OS X package manager ..."
    ruby <(curl -fsS https://raw.githubusercontent.com/Homebrew/install/master/install)
    append_to_zshrc '# recommended by brew doctor'
    append_to_zshrc 'export PATH="/usr/local/bin:$PATH"' 1
    export PATH="/usr/local/bin:$PATH"
else
    fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update
# brew upgrade

brew_tap 'homebrew/dupes'
brew_tap 'homebrew/versions'
brew_tap 'homebrew/boneyard'
brew_tap 'homebrew/science'
brew_tap 'homebrew/php'
brew_tap 'caskroom/cask'
brew_tap 'caskroom/versions'
brew_tap 'caskroom/fonts'
brew_tap 'thoughtbot/formulae'

brew_install_or_upgrade 'caskroom/cask/brew-cask'
brew_cask_install_or_upgrade 'xquartz'

brew_install_or_upgrade 'coreutils'
brew_install_or_upgrade 'moreutils'
brew_install_or_upgrade 'findutils' '--with-default-names'
brew_install_or_upgrade 'gnu-sed' '--with-default-names'
brew_install_or_upgrade 'wget' '--with-iri'
brew_install_or_upgrade 'pcre'
brew_install_or_upgrade 'grep' '--with-default-names'
brew_install_or_upgrade 'ack'
brew_install_or_upgrade 'lynx'
brew_install_or_upgrade 'rename'
brew_install_or_upgrade 'watch'
brew_install_or_upgrade 'md5sha1sum'
brew_install_or_upgrade 'pigz'

brew_install_or_upgrade 'docker'
brew_install_or_upgrade 'boot2docker'

# Languages and Compilers
brew_install_or_upgrade  'php55' '--with-gmp' '--with-pgsql' '--with-phpdbg' '--with-homebrew-openssl' '--with-homebrew-libxslt' '--with-homebrew-curl' '--without-snmp'
brew_install_or_upgrade  'pyenv' 'pyenv-virtualenvwrapper'
brew_install_or_upgrade  'rbenv' 'ruby-build'
brew_install_or_upgrade  'node'
brew_install_or_upgrade  'r' '--with-openblas'
brew_install_or_upgrade  'go' '--cross-compile-all'
brew_install_or_upgrade  'ghc'
brew_install_or_upgrade  'lua' '--with-completion'
brew_install_or_upgrade  'gcc' '--with-all-languages'
brew_install_or_upgrade  'apple-gcc42'
brew_install_or_upgrade  'gdb'

# Databases
# brew_install_or_upgrade  'mysql' '--enable-memcached' https://github.com/Homebrew/homebrew/issues/33448
brew_install_or_upgrade  'mysql'
brew_install_or_upgrade  'postgresql' '--with-python'
brew_install_or_upgrade  'sqlite' '--with-functions'
brew_install_or_upgrade  'mongodb' '--with-openssl'
brew_install_or_upgrade  'redis'
brew_install_or_upgrade  'elasticsearch'
brew_install_or_upgrade  'memcached'
brew_install_or_upgrade  'rabbitmq' 'rabbitmq-c'
brew_install_or_upgrade  'solr'

# Services
# one can also use brew services from the boneyard
# http://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew
brew_launchctl_restart 'mysql'
brew_launchctl_restart 'postgresql'
brew_launchctl_restart 'mongodb'
brew_launchctl_restart 'redis'
brew_launchctl_restart 'elasticsearch'
brew_launchctl_restart 'memcached'
brew_launchctl_restart 'rabbitmq'

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
brew_install_or_upgrade 'vim' '--override-system-vi'
brew_install_or_upgrade 'svn'
brew_install_or_upgrade 'git' '--with-pcre' '--with-brewed-curl' '--with-brewed-openssl' '--with-brewed-svn' '--with-gettext'
brew_install_or_upgrade 'rsync'
brew_install_or_upgrade 'colordiff'
brew_install_or_upgrade 'memtester'
brew_install_or_upgrade 'tig'

# Libraries
brew_install_or_upgrade 'qt'
brew_install_or_upgrade 'tcl-tk'
brew_install_or_upgrade 'openssl'
brew_install_or_upgrade 'libxml2' '--with-python'
brew_install_or_upgrade 'libxslt'
brew_install_or_upgrade 'imagemagick' '--with-fontconfig' '--with-ghostscript' '--with-jp2' '--with-librsvg' '--with-libtiff' '--with-webp'
brew_install_or_upgrade 'freetype'
brew_install_or_upgrade 'libpng'
brew_install_or_upgrade 'jpeg'
brew_install_or_upgrade 'libtiff'
brew_install_or_upgrade 'lame'
brew_install_or_upgrade 'libogg'
brew_install_or_upgrade 'libvorbis'
brew_install_or_upgrade 'x264'
brew_install_or_upgrade 'graphviz'
brew_install_or_upgrade 'android-sdk'

########################################################
# BREW CASK
########################################################

# Development Tools
brew_cask_install_or_upgrade 'iterm2-nightly'
brew_cask_install_or_upgrade 'sublime-text3'
brew_cask_install_or_upgrade 'heroku-toolbelt'
brew_cask_install_or_upgrade 'virtualbox'
brew_cask_install_or_upgrade 'vagrant'
brew_cask_install_or_upgrade 'sequel-pro'
brew_cask_install_or_upgrade 'google-refine'
brew_cask_install_or_upgrade 'macfusion'
brew_cask_install_or_upgrade 'genymotion'

# Data Science Tools
brew_cask_install_or_upgrade 'rstudio' # launchctl setenv RSTUDIO_WHICH_R `which r`
brew_cask_install_or_upgrade 'weka'

# Mockup Tools
brew_cask_install_or_upgrade 'balsamiq-mockups'

# Browsers
brew_cask_install_or_upgrade 'google-chrome-beta'
brew_cask_install_or_upgrade 'firefox-beta'

# Torrent
brew_cask_install_or_upgrade 'transmission'

# Convert Computer to AirServer
brew_cask_install_or_upgrade 'airserver'

# Arduino
brew_cask_install_or_upgrade 'arduino'

# Cloud Storage
brew_cask_install_or_upgrade 'insync'
brew_cask_install_or_upgrade 'dropbox'

# Video Chat
brew_cask_install_or_upgrade 'skype'
brew_cask_install_or_upgrade 'google-hangouts'

# Group Chat
brew_cask_install_or_upgrade 'slack'
brew_cask_install_or_upgrade 'hipchat'

# Record GIFs
brew_cask_install_or_upgrade 'licecap'

# IRC
# brew_cask_install_or_upgrade 'colloquy'

# Android
brew_cask_install_or_upgrade 'android-studio'
brew_cask_install_or_upgrade 'android-file-transfer'

# Mailbox
brew_cask_install_or_upgrade 'mailbox'

# Markdown Editor
brew_cask_install_or_upgrade 'mou'

# Music Player
brew_cask_install_or_upgrade 'spotify'

# File Upload
brew_cask_install_or_upgrade 'cloud'

# Video Player
brew_cask_install_or_upgrade 'vlc'

# Audio Recorder
brew_cask_install_or_upgrade 'audacity'

# Customize Mac Keyboard Settings (i.e. key repeat)
brew_cask_install_or_upgrade 'karabiner'

# Taskbar Icon to Prevent Computer From Falling Alseep
brew_cask_install_or_upgrade 'caffeine'

# Clears up menu bar apps
brew_cask_install_or_upgrade 'bartender'

# Replacement for Mac Spotlight
brew_cask_install_or_upgrade 'alfred'

# Unarchive (unzip) all sorts of files
brew_cask_install_or_upgrade 'the-unarchiver'

# Ebook Reader/Editor
brew_cask_install_or_upgrade 'calibre'

# Quick Look Plugins
# https://github.com/sindresorhus/quick-look-plugins
brew_cask_install_or_upgrade 'qlcolorcode'
brew_cask_install_or_upgrade 'qlstephen'
brew_cask_install_or_upgrade 'qlmarkdown'
brew_cask_install_or_upgrade 'quicklook-json'
brew_cask_install_or_upgrade 'qlprettypatch'
brew_cask_install_or_upgrade 'quicklook-csv'
brew_cask_install_or_upgrade 'betterzipql'
brew_cask_install_or_upgrade 'webp-quicklook'
brew_cask_install_or_upgrade 'suspicious-package'
brew_cask_install_or_upgrade 'provisionql'
brew_cask_install_or_upgrade 'cert-quicklook'

# Fonts
# fonts=(
#   font-m-plus
#   font-clear-sans
#   font-roboto
#   font-open-sans
#   font-source-sans-pro
#   font-lato
#   font-alegreya
#   font-montserrat
#   font-inconsolata
#   font-pt-sans
#   font-quattrocento-sans
#   font-quicksand
#   font-raleway
#   font-sorts-mill-goudy
#   font-ubuntu
# )
# brew cask install ${fonts[@]}

# apps=(
#   slack
#   spotify
#   google-chrome
#   dropbox
#   appcleaner
#   firefox
#   mou
#   iterm2
#   macvim
#   sublime-text
#   gitx
#   testflight
#   vlc
#   google-drive
#   tomighty
#   rescuetime
# )

# for app in "${apps[@]}"
# do
# 	printf "Should I install %s\n" $app
# 	echo "Type Y to accept: \c"
# 	read line
# 	if [ "$line" = Y ] || [ "$line" = y ]; then
# 		brew_cask_install_or_upgrade  $app
# 	fi
# done

brew_cask_install_or_upgrade 'java'

brew_cask_install_or_upgrade 'evernote'
brew_cask_install_or_upgrade 'plex-media-server'
brew_cask_install_or_upgrade 'ccleaner'
brew_cask_install_or_upgrade 'lingon-x'
brew_cask_install_or_upgrade 'seashore'
brew_cask_install_or_upgrade 'geektool'
brew_cask_install_or_upgrade 'menumeters'

brew cleanup
