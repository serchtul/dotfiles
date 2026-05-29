vim.pack.add { 'https://github.com/catppuccin/nvim' }

require('catppuccin').setup { auto_integrations = true }
vim.cmd.colorscheme 'catppuccin-mocha'
