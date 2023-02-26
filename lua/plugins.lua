vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'Mofiqul/vscode.nvim'
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        -- newer commits break the syntax highlighting
        commit = '9bfaf62e42bdcd042df1230e9188487e62a112c0'
    }
  use 'folke/tokyonight.nvim'
end)

