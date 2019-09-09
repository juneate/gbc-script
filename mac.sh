echo "Installing xcode command-line tools..."
xcode-select --install

# Install homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
echo "Updating homebrew..."
brew update

# Install formulae
# echo "Installing formulae..."
# PACKAGES=(
#     bash
#     git
# )
# brew install ${PACKAGES[@]}
echo "Installing git..."
brew install git

# Install casks
# echo "Installing casks..."
# CASKS=(
#     google-chrome
#     visual-studio-code
# )
# echo "Installing cask apps..."
# brew cask install ${CASKS[@]}

if test ! $(which /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome); then
    echo "Installing Google Chrome..."
    brew cask install google-chrome
fi

if test ! $(which /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code); then
    echo "Installing Visual Studio Code..."
    brew cask install visual-studio-code
fi


echo "Configuring system..."
git config --global user.name "gbc-student"
git config --global user.email "info@georgebrown.com"
open -a "Google Chrome" --args --make-default-browser
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

echo "Cleaning up..."
brew cleanup

echo "Bootstrapping complete!"
