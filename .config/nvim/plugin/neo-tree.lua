local plugins = {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
}
if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons')
end
vim.pack.add(plugins)

local function enable_line_numbers()
  vim.wo.number = true
  vim.wo.relativenumber = true
end

require('neo-tree').setup {
  filesystem = {
    hijack_netrw_behavior = 'disabled',
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
  event_handlers = {
    { event = 'neo_tree_buffer_enter', handler = enable_line_numbers },
    { event = 'neo_tree_window_after_open', handler = enable_line_numbers },
    { event = 'neo_tree_popup_buffer_enter', handler = enable_line_numbers },
  },
}

local map = vim.keymap.set
map('n', '<leader>nd', ':Neotree reveal float git_status<CR>', { desc = '[N]eoTree Show Git [D]iff (Status)', silent = true })
map('n', '<leader>n<leader>', ':Neotree reveal float buffers<CR>', { desc = '[N]eoTree Show Buffer Files', silent = true })
map('n', '<leader>nn', ':Neotree reveal float<CR>', { desc = 'NeoTree reveal', silent = true })
map('n', '\\', ':Neotree reveal float<CR>', { desc = 'NeoTree reveal', silent = true })
