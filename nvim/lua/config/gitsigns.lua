require("gitsigns").setup {
  signs = {
    add = { text = "┃" },
    change = { text = "┇" },
    delete = { text = "▶" },
    topdelete = { text = "▶" },
    changedelete = { text = "▶" },
  },
  signs_staged = {
    add = { text = "" },
    change = { text = "" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "" },
  },
  on_attach = function(bufnr) end,
}

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#569CD6" })
    vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#569CD6" })
  end,
})
