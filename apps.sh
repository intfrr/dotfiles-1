# [Brew Cask] Essential Apps
brew_cask_install_or_upgrade 'google-chrome-canary' # bleeding edge daily updates
brew_cask_install_or_upgrade 'google-chrome-dev' # more stable than canary
brew_cask_install_or_upgrade 'firefoxdeveloperedition' # ff developer edition
brew_cask_install_or_upgrade 'logitech-control-center' # to program mouse butons
brew_cask_install_or_upgrade 'logitech-unifying' # for mouse + keyboard
brew_cask_install_or_upgrade 'sizeup' # snap windows by mouse
brew_cask_install_or_upgrade 'cinch' # control window placement via hotkeys
brew_cask_install_or_upgrade 'iterm2-nightly' # terminal emulator
brew_cask_install_or_upgrade 'sublime-text3' # code editor
brew_cask_install_or_upgrade 'atom' # another code editor
brew_cask_install_or_upgrade 'the-unarchiver' # better unarchiving tool
brew_cask_install_or_upgrade 'evernote' # note taker
brew_cask_install_or_upgrade 'insync' # sync google drive documents
brew_cask_install_or_upgrade 'dropbox' # sync files
brew_cask_install_or_upgrade 'skype' # video chat
brew_cask_install_or_upgrade 'google-hangouts' # also video chat
brew_cask_install_or_upgrade 'slack' # team communication
brew_cask_install_or_upgrade 'mailbox' # mail app from dropbox with gestures
brew_cask_install_or_upgrade 'spotify' # streaming music player
brew_cask_install_or_upgrade 'vlc' # video player
brew_cask_install_or_upgrade 'caffeine' # prevent computer from going to sleep
brew_cask_install_or_upgrade 'calibre' # ebook manager
brew_cask_install_or_upgrade 'xtrafinder' # CMD-X for cut
brew_cask_install_or_upgrade 'chromecast'
brew_cask_install_or_upgrade 'fluid'
brew_cask_install_or_upgrade 'goofy' # facebook chat

# [Brew Cask] Development
brew_cask_install_or_upgrade 'pgadmin3'
brew_cask_install_or_upgrade 'virtualbox' # virtual os / emulators
brew_cask_install_or_upgrade 'vagrant' # package virtual envs for development
brew_cask_install_or_upgrade 'sequel-pro' # mysql gui
brew_cask_install_or_upgrade 'google-refine' # dedupe datasets
brew_cask_install_or_upgrade 'macfusion' # use sublime via ssh (sshfs)
brew_cask_install_or_upgrade 'arduino'
brew_cask_install_or_upgrade 'java' # jdk
brew_cask_install_or_upgrade 'weka'
brew_cask_install_or_upgrade 'xquartz'
brew_cask_install_or_upgrade 'tabula'

# [Brew Cask] Non-essential Apps
brew_cask_install_or_upgrade 'android-file-transfer'
brew_cask_install_or_upgrade 'balsamiq-mockups'
brew_cask_install_or_upgrade 'transmission' # torrents
brew_cask_install_or_upgrade 'sabnzbd' # usenet
brew_cask_install_or_upgrade 'airserver'
brew_cask_install_or_upgrade 'licecap' # gif creator
brew_cask_install_or_upgrade 'colloquy' # irc chat client
brew_cask_install_or_upgrade 'haroopad' # markdown editor
brew_cask_install_or_upgrade 'audacity' # audio recording
brew_cask_install_or_upgrade 'karabiner' # faster key strokes
brew_cask_install_or_upgrade 'bartender' # organize your menu bar apps
brew_cask_install_or_upgrade 'cheatsheet'
brew_cask_install_or_upgrade 'ccleaner'
brew_cask_install_or_upgrade 'seashore' # ms paint
brew_cask_install_or_upgrade 'paintbrush' # another ms paint
brew_cask_install_or_upgrade 'geektool' # rainmeter for mac
brew_cask_install_or_upgrade 'menumeters' # display stats in menu
brew_cask_install_or_upgrade 'fritzing' # electrical circuit diagram / breadboard
brew_cask_install_or_upgrade 'flip4mac' # play windows media on mac
brew_cask_install_or_upgrade 'skim' # very nice pdf viewer for note taking

# [Brew Cask] Quick Look Plugins
# https://github.com/sindresorhus/quick-look-plugins
brew_cask_install_or_upgrade 'qlcolorcode' # syntax highlighting
brew_cask_install_or_upgrade 'qlstephen'
brew_cask_install_or_upgrade 'qlmarkdown' # markdown
brew_cask_install_or_upgrade 'quicklook-json' # json
brew_cask_install_or_upgrade 'qlprettypatch' # patch files
brew_cask_install_or_upgrade 'quicklook-csv' # csv
brew_cask_install_or_upgrade 'betterzipql' # zip
brew_cask_install_or_upgrade 'webpquicklook'
brew_cask_install_or_upgrade 'suspicious-package' # pkg files
brew_cask_install_or_upgrade 'provisionql'
brew_cask_install_or_upgrade 'cert-quicklook' # certificates

# Personal PVR
# brew_cask_install_or_upgrade 'plex-media-server'
# brew_install_or_upgrade 'sickbeard'
# brew_install_or_upgrade 'couchpotatoserver'
# brew_install_or_upgrade 'headphones'
# brew services restart 'sickbeard'
# brew services restart 'couchpotatoserver'
# brew services restart 'headphones'

# Misc
brew_install_or_upgrade 'jack'
brew services restart 'jack'