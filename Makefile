all: brew vim 

brew:
	@echo "Brew Bundle"
	@echo "-----------"
	brew bundle

vim:
	@echo "Symlink .vim folder to ~/.vim"
	ln -hi -s `pwd`/.vim ~/.vim
