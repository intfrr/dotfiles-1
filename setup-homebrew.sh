source laptop/mac-components/mac-functions 

brew_cask_expand_alias() {
  brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_is_installed() {
  local NAME=$(brew_cask_expand_alias "$1")
  brew cask list -1 | grep -Fqx "$NAME"
}

brew_cask_install_or_upgrade() {
  if brew_cask_is_installed "$1"; then
  	echo "$1 is already installed, brew cask upgrade is not yet implmented"
  else
    brew cask install "$@"
  fi
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

brew update
brew upgrade

# brew tap | grep -q "homebrew/dupes"; echo $?

brew untap homebrew/dupes && brew tap homebrew/dupes
brew untap homebrew/versions && brew tap homebrew/versions
brew untap homebrew/homebrew-science && brew tap homebrew/homebrew-science
brew untap homebrew/homebrew-php && brew tap homebrew/homebrew-php
brew untap caskroom/cask && brew tap caskroom/cask
brew untap caskroom/versions && brew tap caskroom/versions
brew untap caskroom/fonts && brew tap caskroom/fonts
brew untap thoughtbot/formulae && brew tap thoughtbot/formulae

brew_install_or_upgrade 'caskroom/cask/brew-cask'
brew_cask_install_or_upgrade 'xquartz'

brew_install_or_upgrade 'coreutils'
brew_install_or_upgrade 'moreutils'
brew_install_or_upgrade 'findutils' '--default-names'
brew_install_or_upgrade 'gnu-sed' '--default-names'
brew_install_or_upgrade 'wget' '--enable-iri'
brew_install_or_upgrade 'pcre'
brew_install_or_upgrade 'grep' '--default-names'
brew_install_or_upgrade 'ack'
brew_install_or_upgrade 'lynx'
brew_install_or_upgrade 'rename'
brew_install_or_upgrade 'watch'
brew_install_or_upgrade 'md5sha1sum'

# Languages and Compilers
brew_install_or_upgrade  'php55' '--with-gmp' '--with-pgsql' '--with-phpdbg' '--with-homebrew-openssl' '--with-homebrew-libxslt' '--with-homebrew-curl'
brew_install_or_upgrade  'pyenv' 'pyenv-virtualenvwrapper'
brew_install_or_upgrade  'rbenv' 'ruby-build'
brew_install_or_upgrade  'node'
brew_install_or_upgrade  'r' '--with-openblas'
brew_install_or_upgrade  'go' '--cross-compile-all'
brew_install_or_upgrade  'ghc'
brew_install_or_upgrade  'lua' '--with-completion'
brew_install_or_upgrade  'gcc' '--with-all-languages'
brew_install_or_upgrade  'apple-gcc42'

# Databases
brew_install_or_upgrade  'mysql' '--enable-memcached'
brew_install_or_upgrade  'postgresql' '--with-python'
brew_install_or_upgrade  'sqlite' '--with-functions'
brew_install_or_upgrade  'mongodb' '--with-openssl'
brew_install_or_upgrade  'redis'
brew_install_or_upgrade  'elasticsearch'
brew_install_or_upgrade  'memcached'
brew_install_or_upgrade  'rabbitmq'
brew_install_or_upgrade  'rabbitmq-c'
brew_install_or_upgrade  'solr'

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
brew_install_or_upgrade 'vim' '--override-system-vi' '--with-client-server'
brew_install_or_upgrade 'svn'
brew_install_or_upgrade 'git' '--with-pcre' '--with-brewed-curl' '--with-brewed-openssl' '--with-brewed-svn' '--with-gettext'
brew_install_or_upgrade 'rsync'
brew_install_or_upgrade 'colordiff'

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

########################################################
# BREW CASK
########################################################

# Development Tools
brew_cask_install_or_upgrade 'iterm2-beta'
brew_cask_install_or_upgrade 'sublime-text3'
brew_cask_install_or_upgrade 'heroku-toolbelt'
brew_cask_install_or_upgrade 'virtualbox'
brew_cask_install_or_upgrade 'vagrant'
brew_cask_install_or_upgrade 'sequel-pro'

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
brew_cask_install_or_upgrade 'colloquy'

# Android
brew_cask_install_or_upgrade 'android-file-transfer'

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

brew_cask_install_or_upgrade 'java'

brew cleanup