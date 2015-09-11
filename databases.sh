# Databases and Document Stores
brew_install_or_upgrade 'mysql' # '--enable-memcached' https://github.com/Homebrew/homebrew/issues/33448
brew_install_or_upgrade 'postgresql' '--with-python' # sql database
brew_install_or_upgrade 'sqlite' '--with-functions' # sql datbase
brew_install_or_upgrade 'mongodb' '--with-openssl' # nosql document store
brew_install_or_upgrade 'redis' # in memory key value data store
brew_install_or_upgrade 'elasticsearch' # document search based on lucene
brew_install_or_upgrade 'solr' # document search based on lucene
brew_install_or_upgrade 'memcached'
brew_install_or_upgrade 'rabbitmq' # message queue / broker
brew_install_or_upgrade 'rabbitmq-c' # message queue / broker

brew services restart 'mysql'
brew services restart 'postgresql'
brew services restart 'mongodb'
brew services restart 'redis'
brew services restart 'elasticsearch'
brew services restart 'memcached'
brew services restart 'rabbitmq'
