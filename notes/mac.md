# Notes on changing mac settings via command line

Note: Quick Look doesn't allow selecting text. If you want to select the text in the markdown preview, you will need to enable text selection in Quick Look by running the following in Terminal:

```
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder
```

https://raymii.org/s/snippets/OS-X-Enable-Access-for-assistive-devices-via-command-line.html

```
/usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/SizeUp.app/Contents/Info.plist # com.irradiatedsoftware.SizeUp
/usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/Cinch.app/Contents/Info.plist # com.irradiatedsoftware.Cinch-Direct
/usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/Karabiner.app/Contents/Info.plist # org.pqrs.Karabiner

# Karabiner wrong? Need: org.pqrs.Karabiner-AXNotifier

# check if it already exists in db first ?

SELECT * from access WHERE client="com.irradiatedsoftware.Cinch-Direct";
SELECT * from access WHERE client="com.irradiatedsoftware.SizeUp";
SELECT * from access WHERE client="org.pqrs.Karabiner-AXNotifier";

sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT INTO access VALUES('kTCCServiceAccessibility','com.irradiatedsoftware.SizeUp',0,1,1,NULL);"
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT INTO access VALUES('kTCCServiceAccessibility','com.irradiatedsoftware.Cinch-Direct',0,1,1,NULL);"
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT INTO access VALUES('kTCCServiceAccessibility','org.pqrs.Karabiner-AXNotifier',0,1,1,NULL);"
```
