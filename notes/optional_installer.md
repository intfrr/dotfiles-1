```
# Fonts
# fonts=(
#   font-m-plus
#   font-clear-sans
#   font-roboto
#   font-open-sans
#   font-source-sans-pro
#   font-lato
#   font-alegreya
#   font-montserrat
#   font-inconsolata
#   font-pt-sans
#   font-quattrocento-sans
#   font-quicksand
#   font-raleway
#   font-sorts-mill-goudy
#   font-ubuntu
# )
# brew cask install ${fonts[@]}

# [Brew Cask] Other Applications
# apps=(
#     android-file-transfer
#     balsamiq-mockups
#     transmission
#     airserver
#     licecap
#     colloquy
#     mou
#     audacity
#     karabiner
#     bartender
#     alfred
#     cheatsheet
#     ccleaner
#     lingon-x
#     seashore
#     geektool
#     menumeters
#     plex-media-server
# )

# for app in "${apps[@]}"
# do
#     if ! brew_cask_is_installed $app; then
#         printf "Should I install %s\n" $app
#         echo "Type Y to accept: \c"
#         read line
#         if [ "$line" = Y ] || [ "$line" = y ]; then
#               brew_cask_install_or_upgrade  $app
#         fi
#     else
#         fancy_echo "Already using a version of cask %s. Skipping to ask user ..." app
#     fi
# done
```
