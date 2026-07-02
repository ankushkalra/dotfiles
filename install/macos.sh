if [[ $(command brew -v) == "" ]]; then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Updating homebew"
  brew update
fi

echo "Installing Node.js..."
brew install node --yes
echo "Installing neovim"
brew install neovim --yes
