#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

binaries=(
  coreutils
  moreutils
  findutils
  grc
  python
  node
  tree
  git
  ruby
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
)

apps=(
  alfred
  dropbox
  google-chrome
  flash
  iterm2
  atom
  sequel-pro
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
brew tap samueljohn/python
brew tap homebrew/science

echo "installing binaries..."
brew install ${binaries[@]}

# Installing apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir"/Applications" ${apps[@]}
brew tap caskroom/versions
brew cask alfred link

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
