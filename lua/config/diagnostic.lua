vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  serverity_sort = true,
})

-- Fix the error underline color to bright red
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF0000" })

-- Optional: Fix warning underline colors to a clear orange/yellow
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#FFA500" })
