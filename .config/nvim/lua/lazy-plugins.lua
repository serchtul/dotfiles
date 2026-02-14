-- [[ Configure and install plugins ]]
--
--  To update plugins run
--    :Lazy update

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.which-key',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.lsp',
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.autocomplete',
  require 'plugins.catppuccin',
  require 'kickstart.plugins.todo-comments',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.treesitter',
  -- NOTE: Here are some (yet to be explored) plugins included in the Kickstart repository.
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.neo-tree',

  -- Custom plugins
  require 'plugins.conjure',
  require 'plugins.markdown',
  require 'plugins.autopairs',
  require 'plugins.git-blame',
  require 'plugins.harpoon',
}, {
  ui = {
    -- Leaving this as fallback, in case Nerd Fonts is not available in new hosts
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
