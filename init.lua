require("config.lazy")
require("config.editor")
require("config.remap")
require("config.telescope")
require("config.gitsigns")
require("config.lsp")
require("config.term")
require("config.conform")
require("config.vim-fugitive")
require("config.colorscheme")
require("config.diagnostic")


-- Force Neovim to use modern undercurl terminal codes
vim.cmd([[
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"
]])
