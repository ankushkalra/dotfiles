return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
      vim.lsp.enable("lua_ls")

      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          local function is_fugitive(bufnr)
            bufnr = bufnr or 0
            local name = vim.api.nvim_buf_get_name(bufnr)
            local ft = vim.bo[bufnr].filetype
            return name:match("^fugitive://") ~= nil
                or ft == "fugitive"
                or ft == "fugitiveblame"
                or ft == "git"
          end

          if client:supports_method('textDocument/formatting', args.buf) then
            -- format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                if is_fugitive(args.buf) then return end
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end
  }
}
