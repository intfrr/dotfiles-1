# Installing python packages

```
# http://joernhees.de/blog/2013/06/08/mac-os-x-10-8-scientific-python-with-homebrew/

# if doing brew install pygame i think??
mv /usr/local/include/python2.7/pygame "/Users/atul/.pyenv/versions/$python_version/include/python2.7/"

# how to install pygame on osx
# https://bitbucket.org/pygame/pygame/issue/82/homebrew-on-leopard-fails-to-install#comment-627494
# brew install sdl sdl_image sdl_mixer sdl_ttf portmidi
# pip install hg+http://bitbucket.org/pygame/pygame
# cp -r pygame /Users/atul/.pyenv/versions/2.7.10/include/python2.7/

# wget http://sourceforge.net/projects/pyqt/files/sip/sip-4.16.4/sip-4.16.4.tar.gz
# tar -xvf sip-4.16.4.tar.gz
# cd sip-4.16.4; /usr/local/bin/python configure.py; make; make install

# wget http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.3/PyQt-mac-gpl-4.11.3.tar.gz
# tar -xvf PyQt-mac-gpl-4.11.3.tar.gz
# cd PyQt-mac-gpl-4.11.3; /usr/local/bin/python configure.py --confirm-license; make; make install

pip install virtualenv
pip install virtualenv-clone
pip install virtualenvwrapper

pip install numpy
pip install scipy
pip install scikit-learn
pip install nltk
pip install "ipython[notebook]"
pip install matplotlib
pip install requests
pip install pygments
pip install lxml

python -m nltk.downloader all

# http://matplotlib.org/faq/usage_faq.html#what-is-a-backend

brew install opencv --without-numpy --without-python
#brew uninstall homebrew/python/numpy
```
```
