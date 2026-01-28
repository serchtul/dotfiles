return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  flavour = 'latte',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('catppuccin').setup {
      auto_integrations = true,
    }
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
