vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
}

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

for i, k in ipairs { 'a', 's', 'd', 'f' } do
  vim.keymap.set('n', '<M-' .. k .. '>', function()
    harpoon:list():select(i)
  end, { desc = ('Go to Harpoon Buffer %d'):format(i) })
end
