vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'clojure', 'fennel', 'janet', 'lisp', 'scheme' },
  once = true,
  group = vim.api.nvim_create_augroup('nvim-paredit-lazy-install', { clear = true }),
  callback = function()
    vim.pack.add { 'https://github.com/julienvincent/nvim-paredit' }
    require('nvim-paredit').setup()
  end,
})
