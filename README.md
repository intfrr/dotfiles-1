```
xcode-select --install
# https://github.com/Homebrew/homebrew/issues/23074
download Xcode 5.0.1 for some cmake stuff
make
```

```
export R_HOME="/usr/local/Cellar/r/3.1.0/R.framework/Resources"
```

```
env LDFLAGS="-L/usr/local/Cellar/r/3.1.0/R.framework/Versions/3.1/Resources/lib" pip install rpy2
http://hackr.se/setup-r-and-rstudio-on-mac-os-x/
https://bitbucket.org/lgautier/rpy2/issue/194/libr-not-found-on-os-x-with-homebrew-r
echo setenv RSTUDIO_WHICH_R /usr/local/bin/r | launchctl
export RSTUDIO_WHICH_R=/usr/local/bin/r
https://support.rstudio.com/hc/en-us/articles/200486138-Using-Different-Versions-of-R
```

```
echo 'install ruby' > Brewfile-ruby
echo 'bundle Brewfile-ruby' > Brewfile
brew bundle
```

```
http://stackoverflow.com/a/15948723/1106919 # PIP CACHE
https://github.com/mathiasbynens/dotfiles/blob/master/Brewfile#L39
https://github.com/kevinSuttle/laptop/blob/master/mac-components/node
https://github.com/kevinSuttle/laptop/blob/master/mac-components/Brewfile-casks
https://github.com/pstadler/dotfiles
https://github.com/AlJohri/bash-it/tree/theme-ohmyzsh
https://github.com/robbyrussell/oh-my-zsh
http://unix.stackexchange.com/questions/3428/share-aliases-and-path-setting-between-zsh-and-bash
check it later https://github.com/thejameskyle/favorite-software
http://joernhees.de/blog/2013/06/08/mac-os-x-10-8-scientific-python-with-homebrew/
http://movingthelamppost.com/blog/html/2013/07/12/installing_pyqt____because_it_s_too_good_for_pip_or_easy_install_.html
pip install SIP --allow-external SIP --allow-unverified SIP
wget http://softlayer-dal.dl.sourceforge.net/project/pyqt/PyQt4/PyQt-4.11.1/PyQt-mac-gpl-4.11.1.tar.gz
```

```
brew_install_or_upgrade command
https://github.com/thoughtbot/laptop/blob/2aa635f0e3ff8e0d2ac30c08879ddec641e86b5d/mac
```

```
/usr/libexec/PlistBuddy -c "print :MVChatBookmarks:0:server" ~/Library/Preferences/info.colloquy.plist
# chat.freenode.net

/usr/libexec/PlistBuddy -c "print :MVChatBookmarks:0:rooms" ~/Library/Preferences/info.colloquy.plist
# Array {
#     #celery
#     #pocoo
#     #angularjs
#     #grunt
#     #bower
#     #ui-grid
#     #tornadoweb
#     #twisted.web
#     #twisted
#     #sqlalchemy
#     #dedupe
#     #famous
#     #selenium
#     #dokku
#     #elasticsearch
#     #logstash
#     #python
#     #gevent
#     #solr
# }

/usr/libexec/PlistBuddy -c "print :MVChatBookmarks:1:rooms" ~/Library/Preferences/info.colloquy.plist
# Array {
#     #nuanime
# }

/usr/libexec/PlistBuddy -c "print :MVChatBookmarks:1:server" ~/Library/Preferences/info.colloquy.plist
# irc.rizon.net
```

Note: Quick Look doesn't allow selecting text. If you want to select the text in the markdown preview, you will need to enable text selection in Quick Look by running the following in Terminal:

defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder
