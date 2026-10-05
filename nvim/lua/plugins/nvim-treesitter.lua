return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter.config",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    opts = {
      ensure_installed = { "markdown", "markdown_inline", "javascript", "typescript", "tsx", "python", "lua" },
      highlight = {
        enable = true,
      },
      -- The new main branch handles companion plugins natively via textobjects key inside opts:
      textobjects = {
        select = {
          enable = true,
        },
      },
    },
  },
}
