if ! $(type brew_install_or_upgrade 2>/dev/null); then
	source /dev/stdin  <<< "$(curl -s http://aljohri.com/dotfiles/functions)"
fi

brew uninstall --force ruby

brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'ruby-build'

ruby_version="2.2.2"
eval "$(rbenv init -)"

if ! rbenv versions | grep -Fq "$ruby_version"; then
  rbenv install -s "$ruby_version"
fi

rbenv global "$ruby_version"
rbenv shell "$ruby_version"

gem update --system

gem_install_or_update 'bundler'

fancy_echo "Configuring Bundler ..."
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

rbenv rehash