setup-brew:
	@echo "Brew Bundle"
	@echo "-----------"
	brew bundle

setup-vim:
	@echo "Symlink .vimrc to ~/.vimrc"
	ln -hi -s `pwd`/.vimrc ~/.vimrc

setup-git:
	@echo "Symlink .gitconfig to ~/.gitconfig"
	ln -hi -s `pwd`/.gitconfig ~/.gitconfig
