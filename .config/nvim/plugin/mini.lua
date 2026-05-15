vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

require('mini.ai').setup {
  -- Avoid conflicts with Neovim 0.12's built-in treesitter incremental selection
  -- mappings (`an`, `in`, `[n`, `]n`).
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

require('mini.surround').setup()
require('mini.pairs').setup()

local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v'
end
