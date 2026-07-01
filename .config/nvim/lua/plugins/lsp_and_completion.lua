return {
  -- 1. LSP Configuration & Servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Links LSP data to autocomplete
    },
    config = function()
      local lspconfig = require("lspconfig")
      -- Tell the server that we support autocompletion capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup for JavaScript, TypeScript, and React (.js, .jsx, .ts, .tsx)
      -- Note: 'ts_ls' is the newer name for 'tsserver'
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- Optional: Setup Tailwind CSS if you use it in frontend
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
    end,
  },

  -- 2. Autocompletion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load only when you start typing to save startup time
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",   -- Complete words from the current file
      "hrsh7th/cmp-path",     -- Complete file paths (great for imports)
      "L3MON4D3/LuaSnip",     -- Snippet engine required by nvim-cmp
      "saadparwaiz1/cmp_luasnip", 
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger menu manually
          ["<C-e>"] = cmp.mapping.abort(),        -- Close menu
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept entry
          
          -- Tab navigation through the completion menu
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        -- Order of priority for autocomplete popups
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- 1st Priority: LSP (JS/TS/React code actions)
          { name = "luasnip" },  -- 2nd Priority: Code Snippets
        }, {
          { name = "buffer" },   -- 3rd Priority: Text from current file
          { name = "path" },     -- 4th Priority: File paths for imports
        }),
      })
    end,
  },
}

