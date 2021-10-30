#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

binaries=(
  ack
  coreutils
  moreutils
  findutils
  grc
  python
  node
  nvm
  tree
  git
  ruby
  rbenv 
  ruby-build 
  rbenv-default-gems 
  rbenv-gemset
  mysql
  postgresql
  sqlite
  mongo
  mackup
  gcc
  numpy
  scipy
  lua
  rhino
  mtr
  tree
  scala
  sbt
  openjdk
  rustup
  go
)

apps=(
  alfred
  appcleaner
  cheatsheet
  docker
  docker-machine
  dropbox
  google-chrome
  iterm2
  atom
  sequel-pro
  brackets
  starship
  the-unarchiver
  transmission
  valentina-studio
  visual-studio-code
  vlc
)

fonts=()

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update
brew upgrade --all

brew install caskroom/cask/brew-cask

echo "installing binaries..."
brew install ${binaries[@]}

# Installing apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir"/Applications" ${apps[@]}
brew tap caskroom/versions
brew cask alfred link

#installing Quicklook Plugins
brew install --cask qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip webpquicklook suspicious-package

echo "installing fonts..."
brew tap caskroom/fonts
brew cask install ${fonts[@]}

brew cleanup

# Backup application settings
mackup backup

# NPM
npm install -g coffee-script
npm install -g grunt-cli
npm install -g typescript
npm install -g jshint
npm install -g less
npm install -g express
npm install -g express-generator
npm install -g nodemon
npm install -g gulp
npm install -g mongoose
npm install -g body-parser
npm install -g gulp-mocha
npm install -g should
npm install -g sinon
npm install -g angular

# pip
pip3 install virtualenv
pip3 install numpy 
pip3 install scipy 
pip3 install matplotlib 
pip3 install ipython 
pip3 install jupyter 
pip3 install pandas 
pip3 install sympy 
pip3 install nose
