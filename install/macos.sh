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
echo "Installing tmux"
brew install tmux --yes
echo "Installing ripgrep"
brew install ripgrep --yes
echo "Installing fd"
brew install fd --yes
