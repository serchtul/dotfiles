return {
  {
    'Olical/conjure',
    ft = { 'clojure' },
    lazy = true,
    init = function()
      -- vim.g["conjure#debug"] = true
      vim.g['conjure#mapping#doc_word'] = false
      vim.g['conjure#client#clojure#nrepl#connection#auto_repl#cmd'] = 'lein repl'
    end,
  },
}
