#!/bin/bash

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/thoughtbot/laptop/master/mac)"

brew_cask_install_or_upgrade() {
    if brew_cask_is_installed "$1"; then
        fancy_echo "Already using a version of cask %s. Upgrading not implemented. Skipping ..." "$1"
    else
        brew cask install --appdir="/Applications" "$@"
    fi
}

brew_cask_is_installed() {
    local NAME=$(brew_cask_expand_alias "$1")
    brew cask list -1 | grep -Fqx "$NAME"
}

brew_cask_expand_alias() {
    brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_tap_is_tapped() {
    brew tap | grep -Fqx $1
}

brew_tap() {
    if brew_tap_is_tapped "$1"; then
        fancy_echo "Already tapped %s. Skipping ..." "$1"
    else
        brew tap $1
    fi
}

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -C "al.johri@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add $HOME/.ssh/id_rsa
    pbcopy < $HOME/.ssh/id_rsa.pub
    open https://github.com/settings/ssh
fi

mkdir -p ~/.pip

ln -hi -s `pwd`/templates/commonrc ~/.commonrc
ln -hi -s `pwd`/templates/vimrc ~/.vimrc
ln -hi -s `pwd`/templates/gitconfig ~/.gitconfig
ln -hi -s `pwd`/templates/gemrc ~/.gemrc
ln -hi -s `pwd`/templates/pip.conf ~/.pip/pip.conf
ln -hi -s `pwd`/templates/gitignore ~/.gitignore
ln -hi -s `pwd`/templates/agignore ~/.agignore

append_to_zshrc 'source ~/.commonrc'

brew_tap 'homebrew/dupes'
brew_tap 'homebrew/versions'
brew_tap 'homebrew/science'
brew_tap 'homebrew/php'
brew_tap 'caskroom/cask'
brew_tap 'caskroom/versions'
brew_tap 'caskroom/fonts'

brew_install_or_upgrade 'caskroom/cask/brew-cask'

# [Brew Cask] Essentials
brew_cask_install_or_upgrade 'google-chrome-beta'
brew_cask_install_or_upgrade 'firefox-beta'
brew_cask_install_or_upgrade 'logitech-control-center'
brew_cask_install_or_upgrade 'logitech-unifying'
brew_cask_install_or_upgrade 'sizeup'
brew_cask_install_or_upgrade 'cinch'
brew_cask_install_or_upgrade 'iterm2-nightly'
brew_cask_install_or_upgrade 'sublime-text3'
brew_cask_install_or_upgrade 'the-unarchiver'
brew_cask_install_or_upgrade 'evernote'
brew_cask_install_or_upgrade 'atom'
brew_cask_install_or_upgrade 'insync'
brew_cask_install_or_upgrade 'dropbox'
brew_cask_install_or_upgrade 'cloud'
brew_cask_install_or_upgrade 'skype'
brew_cask_install_or_upgrade 'google-hangouts'
brew_cask_install_or_upgrade 'slack'
brew_cask_install_or_upgrade 'mailbox'
brew_cask_install_or_upgrade 'spotify'
brew_cask_install_or_upgrade 'vlc'
brew_cask_install_or_upgrade 'caffeine'
brew_cask_install_or_upgrade 'calibre'

# [Brew Cask] Development
brew_cask_install_or_upgrade 'virtualbox'
brew_cask_install_or_upgrade 'vagrant'
brew_cask_install_or_upgrade 'sequel-pro'
brew_cask_install_or_upgrade 'google-refine'
brew_cask_install_or_upgrade 'macfusion'
brew_cask_install_or_upgrade 'genymotion'
brew_cask_install_or_upgrade 'android-studio'
brew_cask_install_or_upgrade 'arduino'
brew_cask_install_or_upgrade 'java'
brew_cask_install_or_upgrade 'rstudio'
brew_cask_install_or_upgrade 'weka'
brew_cask_install_or_upgrade 'xquartz'

# [Brew Cask] Other
brew_cask_install_or_upgrade 'android-file-transfer'
brew_cask_install_or_upgrade 'balsamiq-mockups'
brew_cask_install_or_upgrade 'transmission'
brew_cask_install_or_upgrade 'airserver'
brew_cask_install_or_upgrade 'licecap'
brew_cask_install_or_upgrade 'colloquy'
brew_cask_install_or_upgrade 'mou'
brew_cask_install_or_upgrade 'audacity'
brew_cask_install_or_upgrade 'karabiner'
brew_cask_install_or_upgrade 'bartender'
brew_cask_install_or_upgrade 'alfred'
brew_cask_install_or_upgrade 'cheatsheet'
brew_cask_install_or_upgrade 'ccleaner'
brew_cask_install_or_upgrade 'lingon-x'
brew_cask_install_or_upgrade 'seashore'
brew_cask_install_or_upgrade 'geektool'
brew_cask_install_or_upgrade 'menumeters'
brew_cask_install_or_upgrade 'plex-media-server'
brew_cask_install_or_upgrade 'launchrocket'

# [Brew Cask] Quick Look Plugins
# https://github.com/sindresorhus/quick-look-plugins
brew_cask_install_or_upgrade 'qlcolorcode'
brew_cask_install_or_upgrade 'qlstephen'
brew_cask_install_or_upgrade 'qlmarkdown'
brew_cask_install_or_upgrade 'quicklook-json'
brew_cask_install_or_upgrade 'qlprettypatch'
brew_cask_install_or_upgrade 'quicklook-csv'
brew_cask_install_or_upgrade 'betterzipql'
brew_cask_install_or_upgrade 'webpquicklook'
brew_cask_install_or_upgrade 'suspicious-package'
brew_cask_install_or_upgrade 'provisionql'
brew_cask_install_or_upgrade 'cert-quicklook'

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

# Languages and Compilers
brew_install_or_upgrade 'php55' '--with-gmp' '--with-postgresql' '--with-phpdbg' '--with-homebrew-openssl' '--with-homebrew-libxslt' '--with-homebrew-curl' '--without-snmp'
brew_install_or_upgrade 'pyenv'
brew_install_or_upgrade 'pyenv-virtualenvwrapper'
brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'ruby-build'
brew_install_or_upgrade 'r' '--with-openblas'
brew_install_or_upgrade 'go' '--cross-compile-all'
brew_install_or_upgrade 'ghc'
brew_install_or_upgrade 'lua' '--with-completion'
brew_install_or_upgrade 'gcc' '--with-all-languages'
brew_install_or_upgrade 'apple-gcc42'
brew_install_or_upgrade 'gdb'

# Databases
brew_install_or_upgrade 'mysql' # '--enable-memcached' https://github.com/Homebrew/homebrew/issues/33448
brew_install_or_upgrade 'postgresql' '--with-python'
brew_install_or_upgrade 'sqlite' '--with-functions'
brew_install_or_upgrade 'mongodb' '--with-openssl'
brew_install_or_upgrade 'redis'
brew_install_or_upgrade 'elasticsearch'
brew_install_or_upgrade 'memcached'
brew_install_or_upgrade 'rabbitmq'
brew_install_or_upgrade 'rabbitmq-c'
brew_install_or_upgrade 'solr'

brew_launchctl_restart 'mysql'
brew_launchctl_restart 'postgresql'
brew_launchctl_restart 'mongodb'
brew_launchctl_restart 'redis'
brew_launchctl_restart 'elasticsearch'
brew_launchctl_restart 'memcached'
brew_launchctl_restart 'rabbitmq'

python_version="2.7.9"
eval "$(pyenv init -)"

if ! pyenv versions | grep -Fq "$python_version"; then
  pyenv install -s "$python_version"
fi

pyenv global "$python_version"
pyenv shell "$python_version"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  curl -L http://install.ohmyz.sh | sh
fi

fancy_echo "Switch to /usr/local/bin/zsh instead of /bin/zsh"
sudo cp `pwd`/templates/shells /etc/shells

if [ $SHELL != "/usr/local/bin/zsh" ]; then
    fancy_echo "Changing your /bin/zsh shell to /usr/local/bin/zsh ..."
    chsh -s "$(which zsh)"
fi

brew cleanup
