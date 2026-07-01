function getFormatters(formatters)
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
      javascript = getFormatters { "prettierd", "prettier", stop_after_first = true },
      typescript = getFormatters { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = getFormatters { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = getFormatters { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 500,
    },
  },
}
