```
xcode-select --install
make
```

```
integrate with
https://github.com/AlJohri/bash-it/tree/theme-ohmyzsh
https://github.com/robbyrussell/oh-my-zsh
and implement this
http://unix.stackexchange.com/questions/3428/share-aliases-and-path-setting-between-zsh-and-bash
check out
brew_install_or_upgrade command
from https://github.com/thoughtbot/laptop/blob/2aa635f0e3ff8e0d2ac30c08879ddec641e86b5d/mac
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

check it later https://github.com/thejameskyle/favorite-software


Note: Quick Look doesn't allow selecting text. If you want to select the text in the markdown preview, you will need to enable text selection in Quick Look by running the following in Terminal:

defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder
