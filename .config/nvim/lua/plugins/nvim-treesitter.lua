return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Add languages you want to enable here
        ensure_installed = { 'javascript', 'typescript', 'tsx' },
        -- Highlight setup (required for syntax highlighting)
        highlight = {
          enable = true,
          -- Setting `false` will disable the colorscheme highlighting from highlights.scm
          disable = {},
        },
        -- Other modules you might want to enable
        -- textobjects = {
        --   select = {
        --     enable = true,
        --   },
        -- },
      }
    end
  },
}
