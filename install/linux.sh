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
