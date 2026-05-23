return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      update_focused_file = {
        enable = true,      -- Automatically focus the file in the tree
        update_cwd = false, -- Change the tree's root to match the file's dir
      },
    }
  end,
}
