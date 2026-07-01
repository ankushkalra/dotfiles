return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {}
      lspconfig.ts_ls.setup {}

      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting', 0) then
            -- format the current buffer on save
            -- vim.api.nvim_create_autocmd('BufWritePre', {
            --     buffer = args.buf,
            --     callback = function()
            --         vim.lsp.buf.format({ buffer = args.buf, id = client.id })
            --     end,
            -- })
          end
        end,
      })
    end
  }
}
