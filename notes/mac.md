# Notes on changing mac settings via command line

Note: Quick Look doesn't allow selecting text. If you want to select the text in the markdown preview, you will need to enable text selection in Quick Look by running the following in Terminal:

defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

https://raymii.org/s/snippets/OS-X-Enable-Access-for-assistive-devices-via-command-line.html
