local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  main = "nvim-treesitter.config",
  build = ":TSUpdate"
}

return { M }
