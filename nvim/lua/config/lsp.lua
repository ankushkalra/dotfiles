vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['C-e>'] = cmp.mapping.abort(),
    ['<Esc>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

vim.lsp.config("ts_ls", {
  root_dir = require('lspconfig').util.root_pattern("tsconfig.json", "package.json", ".git"),
  init_options = {
    hostInfo = "neovim",
    preferences = {
      -- Disables the automatic JSDoc/type prompt suggestions
      disableSuggestions = true,
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        includeParameterNameHints = "all"
      }
    },
    javascript = {
      validate = false
    }
  },
  on_init = function(client)
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end
})
vim.lsp.enable("ts_ls")

-- lspconfig.cssmodules_ls.setup({
--   init_options = {
--   }
-- })

-- lspconfig.vtsls.setup({
--   root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
--   settings = {
--     typescript = {
--       tsdk = "node_modules/typescript/lib", -- Force it to use your local project's compiler
--       tsserver = {
--         pluginEnable = true,
--       }
--     },
--     javascript = {
--       validate = false -- Avoid duplicate diagnostics if writing pure JS files
--     }
--   }
-- })

-- In case of multiple results in a find, this move teh cursor to selected and closes window maybe
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    local opts = { buffer = true, silent = true }
    vim.keymap.set("n", "<CR>", "<CR><Cmd>cclose<CR>", opts)
  end,
})
