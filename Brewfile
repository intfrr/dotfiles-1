update
upgrade

tap homebrew/dupes
tap homebrew/versions
tap homebrew/homebrew-science
tap homebrew/homebrew-php
tap caskroom/cask
tap caskroom/versions
tap caskroom/fonts
tap thoughtbot/formulae

install caskroom/cask/brew-cask

cask install xquartz

reinstall coreutils
reinstall moreutils
reinstall findutils --default-names
reinstall gnu-sed --default-names
reinstall wget --enable-iri
reinstall pcre
reinstall grep --default-names
reinstall screen
reinstall ack
reinstall lynx
reinstall rename
reinstall watch
reinstall md5sha1sum

# Languages and Compilers
reinstall php55 --with-gmp --with-pgsql --with-phpdbg --with-homebrew-openssl --with-homebrew-libxslt --with-homebrew-curl
reinstall pyenv pyenv-virtualenvwrapper
reinstall rbenv ruby-build
reinstall node
reinstall r --with-openblas
reinstall go --cross-compile-all
reinstall ghc
reinstall lua --with-completion
reinstall gcc --with-all-languages
reinstall apple-gcc42

# Databases
reinstall mysql --enable-memcached
reinstall postgresql --with-python
reinstall sqlite --with-functions
reinstall mongodb --with-openssl
reinstall redis
reinstall elasticsearch
reinstall memcached
reinstall rabbitmq
reinstall rabbitmq-c
reinstall solr

services restart mysql
services restart postgresql
services restart mongodb
services restart redis
services restart elasticsearch
services restart memcached
services restart rabbitmq

# Misc
reinstall jack
services restart jack

# Shells
reinstall bash
reinstall bash-completion
reinstall zsh --disable-etcdir

# Command Line Tools
reinstall the_silver_searcher
reinstall tree
reinstall vim --override-system-vi --with-client-server
reinstall svn
reinstall git --with-pcre --with-brewed-curl --with-brewed-openssl --with-brewed-svn --with-gettext
reinstall rsync
reinstall colordiff

# Libraries
reinstall qt
reinstall tcl-tk
reinstall openssl
reinstall libxml2 --with-python
reinstall libxslt
reinstall imagemagick --with-fontconfig --with-ghostscript --with-jp2 --with-librsvg --with-libtiff --with-webp
reinstall freetype
reinstall libpng
reinstall jpeg
reinstall libtiff
reinstall lame
reinstall libogg
reinstall libvorbis
reinstall x264

########################################################
# BREW CASK
########################################################

# Development Tools
cask install iterm2-beta
cask install sublime-text3
cask install heroku-toolbelt
cask install virtualbox
cask install vagrant
cask install sequel-pro

# Data Science Tools
cask install rstudio # launchctl setenv RSTUDIO_WHICH_R `which r`
cask install weka

# Mockup Tools
cask install balsamiq-mockups

# Browsers
cask install google-chrome-beta
cask install firefox-beta

# Torrent
cask install transmission

# Convert Computer to AirServer
cask install airserver

# Arduino
cask install arduino

# Cloud Storage
cask install insync
cask install dropbox

# Video Chat
cask install skype
cask install google-hangouts

# Group Chat
cask install slack
cask install hipchat

# Record GIFs
cask install licecap

# IRC
cask install colloquy

# Android
cask install android-file-transfer

# Markdown Editor
cask isntall mou

# Music Player
cask install spotify

# File Upload
cask install cloud

# Video Player
cask install vlc

# Audio Recorder
cask install audacity

# Customize Mac Keyboard Settings (i.e. key repeat)
cask install karabiner

# Taskbar Icon to Prevent Computer From Falling Alseep
cask install caffeine

# Clears up menu bar apps
cask install bartender

# Replacement for Mac Spotlight
cask install alfred

# Unarchive (unzip) all sorts of files
cask install the-unarchiver

# Ebook Reader/Editor
cask isntall calibre

# Quick Look Plugins
# https://github.com/sindresorhus/quick-look-plugins
cask install qlcolorcode
cask install qlstephen
cask install qlmarkdown
cask install quicklook-json
cask install qlprettypatch
cask install quicklook-csv
cask install betterzipql
cask install webp-quicklook
cask install suspicious-package
cask install provisionql
cask install cert-quicklook

cask install java

cleanup
