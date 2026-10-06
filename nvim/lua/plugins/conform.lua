local function getFormatters(formatters)
  return function(bufnr)
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match("^fugitive://") then
      return {}
    else
      return formatters
    end
  end
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = getFormatters { "stylua" },
      c = getFormatters { "clang-format" },
      css = getFormatters { "prettierd", "prettier", stop_after_first = true },
      json = getFormatters { "prettierd", "prettier", stop_after_first = true },
      javascript = getFormatters { "prettierd", "prettier", stop_after_first = true },
      typescript = getFormatters { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = getFormatters { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = getFormatters { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = function(bufnr)
      if vim.api.nvim_buf_get_name(bufnr):match("^fugitive://") then
        return
      end

      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000 }
    end,
  },
}
