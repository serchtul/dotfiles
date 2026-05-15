vim.pack.add {
  'https://github.com/folke/lazydev.nvim',
  { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range '2.*' },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
}

require('luasnip').setup {}

---@module 'blink.cmp'
---@type blink.cmp.Config
require('blink.cmp').setup {
  keymap = {
    preset = 'enter',
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
}
