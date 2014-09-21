# Add source ~/.commonrc to zshrc
if ! grep -qe "^source ~/.commonrc$" ~/.zshrc; then
	echo "Adding 'source ~/.commonrc' to ~/.zshrc"
	echo "source ~/.commonrc" >> ~/.zshrc
fi

# Add source ~/.commonrc to bash_profile
if ! grep -qe "^source ~/.commonrc$" ~/.bash_profile; then
	echo "Adding 'source ~/.commonrc' to ~/.bash_profile"
	echo "source ~/.commonrc" >> ~/.bash_profile
fi