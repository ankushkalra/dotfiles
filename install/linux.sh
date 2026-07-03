if ! command -v apt &> /dev/null; then
    echo "Error: 'apt' package manager not found."
    echo "This script requires a Debian-based system (like Ubuntu or Debian)."
    echo "Please install the software manually using your system's package manager."
    exit 1
fi

sudo apt update

echo "Installing node.js"
sudo apt install nodejs npm -y

echo "Installing neovim"
sudo apt install neovim -y

echo "Installing tmux"
sudo apt install tmux -y

echo "Installing ripgrep"
sudo apt install ripgrep -y

echo "Installing fd-find"
sudo apt install fd-find -y
echo "Linking fd-find as fd"
ln -s $(which fdfind) ~/.local/bin/fd
echo "Make sure that \$HOME/.local/bin is in your \$PATH."
