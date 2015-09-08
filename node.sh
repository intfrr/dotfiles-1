brew uninstall --force node

brew_install_or_upgrade 'nvm'

node_version="0.12.4"
mkdir -p "$HOME/.nvm"
cp "$(brew --prefix nvm)/nvm-exec" "$HOME/.nvm/"
source "$(brew --prefix nvm)/nvm.sh"
nvm install "$node_version"
fancy_echo "Setting $node_version as the global default nodejs..."
nvm alias default "$node_version"

npm install -g yo generator-angular bower grunt-cli
