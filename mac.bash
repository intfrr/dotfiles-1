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

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/brew.sh)"

brew_install_or_upgrade 'openssl'
brew unlink openssl && brew link openssl --force

# [Brew Cask] Development
brew_cask_install_or_upgrade 'pgadmin3'
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
brew_cask_install_or_upgrade 'tabula'

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/apps.sh)"

# Misc
brew_install_or_upgrade 'jack'
brew services restart 'jack'

# Shells
brew_install_or_upgrade 'bash'
brew_install_or_upgrade 'bash-completion'
brew_install_or_upgrade 'zsh' '--without-etcdir'

# Command Line Tools
brew_install_or_upgrade 'the_silver_searcher'
brew_install_or_upgrade 'tree'
brew_install_or_upgrade 'vim' '--override-system-vi' '--without-python' # '--enable-pythoninterp'
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
brew_install_or_upgrade 'ssh-copy-id'

# Version Control
brew_install_or_upgrade 'svn'
brew_install_or_upgrade 'mercurial'
brew_install_or_upgrade 'git' # '--with-pcre' '--with-brewed-curl' '--with-brewed-openssl' '--with-brewed-svn' '--with-gettext'
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
# TODO: error with php line, debug later
# brew_install_or_upgrade 'homebrew/php/php55' '--with-gmp' '--with-postgresql' '--with-phpdbg' '--with-homebrew-openssl' '--with-homebrew-libxslt' '--with-homebrew-curl' '--without-snmp' # php55-xdebug
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

brew services restart 'mysql'
brew services restart 'postgresql'
brew services restart 'mongodb'
brew services restart 'redis'
brew services restart 'elasticsearch'
brew services restart 'memcached'
brew services restart 'rabbitmq'

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
ln -fs "$(pwd)/templates/gitignore_global" ~/.gitignore_global

mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
if [ ! -f "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package" ]; then
  # http://stackoverflow.com/questions/19529999/add-package-control-in-sublime-text-3-through-the-command-line
  fancy_echo "Installing Sublime Text 3 Package Manager"
  wget https://sublime.wbond.net/Package%20Control.sublime-package -P "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/"
  ln -fs "$(pwd)/templates/Package Control.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
fi

append_to_zshrc 'source ~/.commonrc'

################

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/node.sh)"
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/ruby.sh)"
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/python.sh)"

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/osx.sh)"

###############################################################################
# Kill affected applications                                                  #
###############################################################################

# remove iTErm2 from killed applications
# "iTerm2"

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
	"Transmission" "Twitter" "iCal"; do
	killall "${app}" > /dev/null 2>&1 && echo "${app} killed" || echo "${app} not running"
done
