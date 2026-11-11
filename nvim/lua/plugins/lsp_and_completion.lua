return {
  -- 1. LSP Configuration & Servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Links LSP data to autocomplete
    },
    config = function()
      -- Tell the server that we support autocompletion capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { "vim" } } } }
      })

      -- Setup for JavaScript, TypeScript, and React (.js, .jsx, .ts, .tsx)
      -- Note: 'ts_ls' is the newer name for 'tsserver'
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      -- Optional: Setup Tailwind CSS if you use it in frontend
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })

      vim.lsp.enable({ "lua_ls", "ts_ls", "tailwindcss" })

      -- Format keymap
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

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
    end,
  },

  -- 2. Autocompletion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load only when you start typing to save startup time
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer", -- Complete words from the current file
      "hrsh7th/cmp-path",   -- Complete file paths (great for imports)
      "L3MON4D3/LuaSnip",   -- Snippet engine required by nvim-cmp
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
          ["<C-Space>"] = cmp.mapping.complete(),            -- Trigger menu manually
          ["<C-e>"] = cmp.mapping.abort(),                   -- Close menu
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
