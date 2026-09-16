return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require('neoscroll')

    neoscroll.setup({
      -- Disable default mappings so we can declare mouse and keyboard together manually below
      mappings = {},
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing = "quadratic",
    })

    -- Define custom controls (Key, Command, {Args for lines, move_cursor, duration})
    local keymap = {
      -- Keyboard: Half-page scrolling
      ["<C-u>"]             = function() neoscroll.scroll(-vim.wo.scroll, true, 250) end,
      ["<C-d>"]             = function() neoscroll.scroll(vim.wo.scroll, true, 250) end,
      -- Keyboard: Full-page scrolling
      ["<C-b>"]             = function() neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 450) end,
      ["<C-f>"]             = function() neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 450) end,
      -- Keyboard: Line-by-line viewport adjustment
      ["<C-y>"]             = function() neoscroll.scroll(-1, false, 100) end,
      ["<C-e>"]             = function() neoscroll.scroll(1, false, 100) end,

      -- Mouse Wheel: Scroll 3 lines per notch for a snappy natural feel
      ["<ScrollWheelUp>"]   = function() neoscroll.scroll(-3, false, 80) end,
      ["<ScrollWheelDown>"] = function() neoscroll.scroll(3, false, 80) end,
    }

    -- Apply the mappings to Normal, Visual, and Select modes
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func, { silent = true })
    end
  end
}
