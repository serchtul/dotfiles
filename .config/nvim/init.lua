vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Make terminal buffers unlisted',
  group = vim.api.nvim_create_augroup('unlist-terminal-buffers', { clear = false }),
  callback = function()
    vim.bo.buflisted = false
  end,
})

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local out = result.stderr ~= '' and result.stderr or result.stdout
    if not out or out == '' then
      out = 'No output from build command.'
    end
    vim.notify(('Build failed for %s:\n%s'):format(name, out), vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then
      return
    end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
    elseif name == 'LuaSnip' and vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make', 'install_jsregexp' }, ev.data.path)
    elseif name == 'nvim-treesitter' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    elseif name == 'blink.cmp' then
      local ok, blink = pcall(require, 'blink.cmp')
      if ok and blink.build then
        blink.build():wait(60000)
      end
    end
  end,
})
