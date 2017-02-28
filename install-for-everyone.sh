#!/bin/sh
# Provisioning script for the terminal of any Grrr team member.
# @author David Spreekmeester <david@grrr.nl>

# Install Xcode command line tools
#xcode-select --install

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&

# Run brew doctor to check for issues
brew doctor &&

brew update &&
brew cleanup &&

# Install dev tools
brew install wget &&
brew install the_silver_searcher &&
brew install httpie &&

# Install caskroom so we can install applications
brew install caskroom/cask/brew-cask &&

# Install cask applications __________________________

# This should be done through the App Store, because of the license
# brew cask install 1password

brew cask install alfred &&
brew cask install dropbox &&
brew cask install spotify &&
brew cask install iterm2 &&
brew cask install google-drive &&
brew cask install skype &&
brew cask install slack &&
brew cask install harvest &&
brew cask install caffeine &&
#brew cask install bittorrent-sync # is nu Resilio, naam checken
brew cask install google-chrome &&

brew linkapps &&

# Make Alfred search in brew cask install location
brew cask alfred &&

# Cleanup downloads
brew cask cleanup &&

echo "\nDone! 🤖\n"