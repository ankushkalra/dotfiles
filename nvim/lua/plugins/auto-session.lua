return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    pre_save_cmds = {
      function()
        require("nvim-tree.api").tree.close()
      end,
    },
    post_save_cmds = {
      function()
        local api = require("nvim-tree.api")
        api.tree.open()
        api.tree.change_root(vim.fn.getcwd())
        api.tree.reload()
      end
    },
    -- log_level = 'debug'
    no_restore_cmds = {
      function()
        require("nvim-tree.api").tree.open()
      end,
    },
  },
}
