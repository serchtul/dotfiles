--[[

This config file uses Kickstart.nvim as a starting point for my Neovim configuration.
See https://github.com/nvim-lua/kickstart.nvim for more information.

=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

(P.S. I left the ASCII art because I thought it was kinda sick.)

NOTE: Some interesting reading items from the original kickstart file
- :Tutor
- https://learnxinyminutes.com/docs/lua/
- :help lua-guide (or HTML version): https://neovim.io/doc/user/lua-guide.html

--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Avoids screwing up buffer navigation and buffer search when terms are auto-created (e.g.: by Conjure)
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Make terminal buffers unlisted',
  group = vim.api.nvim_create_augroup('unlist-terminal-buffers', { clear = false }),
  callback = function()
    vim.bo.buflisted = false
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
