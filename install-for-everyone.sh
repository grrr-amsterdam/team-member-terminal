#!/bin/sh
# Provisioning script for the terminal of any Grrr team member.
# @author David Spreekmeester <david@grrr.nl>

# Install Xcode command line tools
#xcode-select --install

# Add current user to wheel group
sudo dseditgroup -o edit -a $(whoami) -t user wheel &&

# Fix Homebrew permissions
sudo chown -R $(whoami):wheel /usr/local/Homebrew && 
sudo chown -R $(whoami) /usr/local/Cellar &&
sudo chown -R $(whoami) /usr/local/var/homebrew &&

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
brew cask install resilio-sync &&
brew cask install google-chrome &&

brew linkapps &&

# Make Alfred search in brew cask install location
brew cask alfred &&

# Cleanup downloads
brew cask cleanup &&

echo "\nDone! 🤖\n"
