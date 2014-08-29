setup-brew:
	@echo "Brew Bundle"
	@echo "-----------"
	brew bundle

setup-vimrc:
	@echo "Symlink vimrc to ~/.vimrc"
	ln -hi -s `pwd`/vimrc ~/.vimrc

setup-gemrc:
	@echo "Symlink gemrc to ~/.gemrc"
	ln -hi -s `pwd`/gemrc ~/.gemrc

setup-git:
	@echo "Symlink .gitconfig to ~/.gitconfig"
	ln -hi -s `pwd`/.gitconfig ~/.gitconfig
