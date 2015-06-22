# Dotfiles + Laptop Setup Script

Highly inspired by https://github.com/thoughtbot/laptop

# Setup

1. Run script

    ```bash
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
  - Office 2016 ```wget http://officecdn.microsoft.com/pr/OfficeMac/OfficePreview.pkg```
  - Finale 2014
  - Stata
  - Macaw
3. Create "Trello" via Fluid app.
4. Reconfigure Northwestern VPN.
5. Install Safari Extensions

    ```bash
    wget https://update.adblockplus.org/latest/adblockplussafari.safariextz && open adblockplussafari.safariextz
    wget https://s3-us-west-1.amazonaws.com/antrikshyprojects/RecoverTabs.safariextz && open RecoverTabs.safariextz
    wget http://pocket-extensions.s3.amazonaws.com/safari/Pocket.safariextz && open Pocket.safariextz
    ```

6. Install BasicTex

    ```bash
    wget http://tug.org/cgi-bin/mactex-download/BasicTeX.pkg && open BasicTeX.pkg
    sudo chown -R `whoami`:admin /usr/local/texlive
    tlmgr install collection-fontsrecommended
    ```
