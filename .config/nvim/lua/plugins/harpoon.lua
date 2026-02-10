return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }
    harpoon:extend(require('harpoon.extensions').builtins.highlight_current_file())

    vim.keymap.set('n', '<leader>aa', function()
      harpoon:list():add()
    end, { desc = 'H[a]rpoon [A]dd Buffer' })
    vim.keymap.set('n', '<leader>al', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'H[a]rpoon [T]oggle Quick Menu' })

    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(1)
    end, { desc = 'Go to First Harpoon Buffer' })
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(2)
    end, { desc = 'Go to Second Harpoon Buffer' })
    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(3)
    end, { desc = 'Go to Third Harpoon Buffer' })
  end,
}
