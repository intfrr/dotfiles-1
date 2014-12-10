all: setup-commonrc setup-homebrew setup-vimrc setup-gemrc setup-git setup-shells

setup-homebrew:
	@echo "Setup Homebrew"
	@echo "-----------"
	./setup-homebrew.bash

setup-ssh:
	ssh-keygen -t rsa -C "al.johri@gmail.com"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
	pbcopy < ~/.ssh/id_rsa.pub
	open https://github.com/settings/ssh

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
	./setup-commonrc.bash

setup-python:
	pyenv install 2.7.7
	rbenv global 2.7.8

setup-pipconf:
	@echo "Symlink pip.config to ~/.pip/pip.conf"
	mkdir -p ~/.pip
	ln -hi -s `pwd`/pip.conf ~/.pip/pip.conf

setup-ruby:
	rbenv install 2.1.5
	rbenv global 2.1.5

setup-pythonpackages:
	# wget http://sourceforge.net/projects/pyqt/files/sip/sip-4.16.4/sip-4.16.4.tar.gz
	# tar -xvf sip-4.16.4.tar.gz
	# cd sip-4.16.4; /usr/local/bin/python configure.py; make; make install

	# wget http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.3/PyQt-mac-gpl-4.11.3.tar.gz
	# tar -xvf PyQt-mac-gpl-4.11.3.tar.gz
	# cd PyQt-mac-gpl-4.11.3; /usr/local/bin/python configure.py --confirm-license; make; make install

	/usr/local/bin/pip install numpy
	/usr/local/bin/pip install scipy
	/usr/local/bin/pip install scikit-learn
	/usr/local/bin/pip install nltk
	/usr/local/bin/pip install "ipython[notebook]"
	/usr/local/bin/pip install matplotlib
	/usr/local/bin/pip install requests
	/usr/local/bin/pip install pygments
	/usr/local/bin/pip install lxml
	/usr/local/bin/python -m nltk.downloader all
	/usr/local/bin/pip install virtualenv
	/usr/local/bin/pip install virtualenv-clone
	/usr/local/bin/pip install virtualenvwrapper

	# http://matplotlib.org/faq/usage_faq.html#what-is-a-backend

setup-shells:
	@echo "Copying shells to /etc/shells"
	sudo cp shells /etc/shells

setup-zsh:
	curl -L http://install.ohmyz.sh | sh