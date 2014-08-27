```
xcode-select --install
make
```

```
echo 'install ruby' > Brewfile-ruby
echo 'bundle Brewfile-ruby' > Brewfile
brew bundle
```

```
https://github.com/mathiasbynens/dotfiles/blob/master/Brewfile#L39
https://github.com/kevinSuttle/laptop/blob/master/mac-components/node
https://github.com/kevinSuttle/laptop/blob/master/mac-components/Brewfile-casks
https://github.com/pstadler/dotfiles
https://github.com/AlJohri/bash-it/tree/theme-ohmyzsh
https://github.com/robbyrussell/oh-my-zsh
http://unix.stackexchange.com/questions/3428/share-aliases-and-path-setting-between-zsh-and-bash
check it later https://github.com/thejameskyle/favorite-software
http://joernhees.de/blog/2013/06/08/mac-os-x-10-8-scientific-python-with-homebrew/
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
