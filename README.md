# Dotfiles + Laptop Setup Script

Highly inspired by https://github.com/thoughtbot/laptop

# Setup

1. Run script

    ```
    xcode-select --install
    sudo xcodebuild -license # contrary to https://github.com/thoughtbot/laptop/issues/245#issuecomment-49395269 ?
    curl -s https://raw.githubusercontent.com/AlJohri/dotfiles/master/mac.bash | bash
    ```

2. Install this manually:
  - Wunderlist
  - XCode
  - Mint Quickview
  - iMovie
  - Garageband
  - Adobe CS6
  - Office 2011 (or 2016 Preview)
  - Finale 2014
  - Stata
  - Macaw
  - Tex
3. Create "Trello" via Fluid app.
4. Reconfigure Northwestern VPN.
5. Install Safari Extensions

    ```
    wget https://update.adblockplus.org/latest/adblockplussafari.safariextz && open adblockplussafari.safariextz
    wget https://s3-us-west-1.amazonaws.com/antrikshyprojects/RecoverTabs.safariextz && open RecoverTabs.safariextz
    wget http://pocket-extensions.s3.amazonaws.com/safari/Pocket.safariextz && open Pocket.safariextz
    ```

6. Install BasicTex

    ```
    wget http://tug.org/cgi-bin/mactex-download/BasicTeX.pkg && open BasicTeX.pkg
    sudo chown -R `whoami` /usr/local/texlive
    tlmgr install collection-fontsrecommended
    ```
