all: setup-commonrc setup-brew setup-vimrc setup-gemrc setup-git

setup-brew:
	@echo "Setup Homebrew"
	@echo "-----------"
	sh setup-homebrew.sh

setup-vimrc:
	@echo "Symlink vimrc to ~/.vimrc"
	ln -hi -s `pwd`/vimrc ~/.vimrc

setup-gemrc:
	@echo "Symlink gemrc to ~/.gemrc"
	ln -hi -s `pwd`/gemrc ~/.gemrc

setup-git:
	@echo "Symlink gitconfig to ~/.gitconfig"
	ln -hi -s `pwd`/gitconfig ~/.gitconfig

setup-commonrc:
	@echo "Symlink commonrc to ~/.commonrc"
	ln -hi -s `pwd`/commonrc ~/.commonrc
	@echo "Adding 'source ~/.commonrc' to zsh and/or bash profiles"
	sh setup-commonrc.sh
