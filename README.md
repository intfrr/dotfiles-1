```
# sublime enable vertical select via keyboard on osx
# http://stackoverflow.com/a/18957047/1667241
```

```
xcode-select --install
# https://github.com/Homebrew/homebrew/issues/23074
# download Xcode 5.0.1 for some cmake stuff
sudo xcodebuild -license # after downloading xcode
```

https://github.com/ealimonda/dotfiles
https://github.com/thoughtbot/dotfiles
https://github.com/kevinSuttle/laptop
https://github.com/IcaliaLabs/kaishi/blob/master/kaishi-mac
https://github.com/croaky/dotfiles/blob/master/laptop.local
http://robots.thoughtbot.com/keeping-a-github-fork-updated

how to install pygame on osx
https://bitbucket.org/pygame/pygame/issue/82/homebrew-on-leopard-fails-to-install#comment-627494

```
disable r; 'disable r' >> ~/.zshrc;
export R_HOME=`Rscript -e "R.home(component = 'home')" | awk -F'"' '{print $2}'`
env LDFLAGS=-L$R_HOME/lib pip install rpy2
echo setenv RSTUDIO_WHICH_R $(brew --prefix r) | launchctl
export RSTUDIO_WHICH_R=$(brew --prefix r)

# http://hackr.se/setup-r-and-rstudio-on-mac-os-x/
# https://bitbucket.org/lgautier/rpy2/issue/194/libr-not-found-on-os-x-with-homebrew-r
# https://support.rstudio.com/hc/en-us/articles/200486138-Using-Different-Versions-of-R
```

Vagrant https://github.com/dotless-de/vagrant-vbguest
```
vagrant plugin install vagrant-vbguest
```

https://github.com/bling/vim-airline
https://github.com/Lokaltog/powerline
https://github.com/jxnl/vim-files/blob/master/vimrc#L12

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
```

http://movingthelamppost.com/blog/html/2013/07/12/installing_pyqt____because_it_s_too_good_for_pip_or_easy_install_.html
```
# go to any tmp directory 
# pip install sip --allow-external sip --allow-unverified sip --download="."
wget http://sourceforge.net/projects/pyqt/files/sip/sip-4.16.4/sip-4.16.4.tar.gz
tar -xvf sip-4.16.4.tar.gz
cd sip-4.16.4
python configure.py --confirm-license
make
make install

# back to tmp directory
cd ../
wget http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.3/PyQt-mac-gpl-4.11.3.tar.gz
tar -xvf PyQt-mac-gpl-4.11.3.tar.gz
cd PyQt-mac-gpl-4.11.3
python configure.py --confirm-license
make
make install

# change your backend
http://matplotlib.org/faq/usage_faq.html#what-is-a-backend
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

```
# https://github.com/thoughtbot/laptop/issues/289
# http://stackoverflow.com/questions/8768420/how-to-convert-command-output-to-an-array-line-by-line-in-bash/8768435#8768435
# http://stackoverflow.com/questions/17988915/comparing-two-sorted-arrays/17989328#17989328

brew info php55 --json=v1 | jq --raw-output '.[0].linked_keg as $linked_keg | .[0].installed | map(select(.version == $linked_keg))[].used_options | sort | .[] | tostring'

IFS=$'\n'; used_options=( $(brew info php55 --json=v1 | jq --raw-output '.[0].linked_keg as $linked_keg | .[0].installed | map(select(.version == $linked_keg))[].used_options | sort | .[] | tostring') )

brew list -1 | while read line; do; echo $line; brew info $line --json=v1 | jq '.[0].linked_keg as $linked_keg | .[0].installed | map(select(.version == $linked_keg))[].used_options'; done

>> /dev/null; if [[ -z $(brew ls --versions coreutils) ]]; then brew install coreutils; fi

```
