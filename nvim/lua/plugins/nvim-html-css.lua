return {
  "Jezda1337/nvim-html-css",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("html-css").setup({
      -- Enable it for typescriptreact (.tsx) files
      file_types = { "html", "javascriptreact", "typescriptreact" },
      style_sheets = {
        -- Scans the active folder dynamically for plain css adjustments
        "./**/*.css",
      }
    })

    -- Map your jumping key bind (Example: <leader>gd to Go to CSS Definition)
    vim.keymap.set("n", "<leader>gd", "<cmd>HtmlCssGoToDefinition<CR>", { desc = "Go to CSS Definition" })
  end
}
