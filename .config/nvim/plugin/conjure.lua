vim.api.nvim_create_autocmd('FileType', {
  pattern = 'clojure',
  once = true,
  group = vim.api.nvim_create_augroup('conjure-lazy-install', { clear = true }),
  callback = function()
    vim.g['conjure#mapping#doc_word'] = false
    vim.g['conjure#client#clojure#nrepl#connection#auto_repl#cmd'] = 'lein repl'
    vim.pack.add { 'https://github.com/Olical/conjure' }

    vim.api.nvim_create_autocmd('TermOpen', {
      desc = 'Make terminal buffers unlisted',
      group = vim.api.nvim_create_augroup('unlist-terminal-buffers', { clear = false }),
      callback = function()
        vim.bo.buflisted = false
      end,
    })
  end,
})
