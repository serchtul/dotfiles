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

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd Buffer' })
    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon Toggle Quick Menu' })

    vim.keymap.set('n', '<M-a>', function()
      harpoon:list():select(1)
    end, { desc = 'Go to First Harpoon Buffer' })
    vim.keymap.set('n', '<M-s>', function()
      harpoon:list():select(2)
    end, { desc = 'Go to Second Harpoon Buffer' })
    vim.keymap.set('n', '<M-d>', function()
      harpoon:list():select(3)
    end, { desc = 'Go to Third Harpoon Buffer' })
    vim.keymap.set('n', '<M-f>', function()
      harpoon:list():select(4)
    end, { desc = 'Go to Fourth Harpoon Buffer' })
  end,
}
