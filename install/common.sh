ln -sf "$PWD"/.zshrc "$HOME"/.zshrc
ln -sf "$PWD"/.p10k.zsh "$HOME"/.p10k.zsh
ln -sf "$PWD"/.gitconfig "$HOME"/.gitconfig
mkdir -p "$HOME"/.config
ln -sfn "$PWD"/.config/nvim "$HOME"/.config/nvim
