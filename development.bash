source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/node.sh)"
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/ruby.sh)"
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/python.sh)"

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

# Version Control
brew_install_or_upgrade 'svn'
brew_install_or_upgrade 'mercurial'
brew_install_or_upgrade 'git' # '--with-pcre' '--with-brewed-curl' '--with-brewed-openssl' '--with-brewed-svn' '--with-gettext'
brew_install_or_upgrade 'tig' # text interface git
brew_install_or_upgrade 'git-flow'
brew_install_or_upgrade 'hub' # Since v2.2.0, gh has been merged into hub.
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

# Heroku
brew_install_or_upgrade 'heroku-toolbelt'
heroku plugins:install https://github.com/heroku/heroku-repo.git
heroku plugins:install git://github.com/ddollar/heroku-config.git

source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/databases.sh)"