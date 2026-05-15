vim.pack.add { 'https://github.com/catppuccin/nvim' }

---@diagnostic disable-next-line: missing-fields
require('catppuccin').setup {
  auto_integrations = true,
}
vim.cmd.colorscheme 'catppuccin-mocha'
