vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
}

local parsers = {
  'bash',
  'c',
  'clojure',
  'css',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
}

require('nvim-treesitter').install(parsers)

---@param buf integer
---@param lang string
local function try_attach(buf, lang)
  if not vim.treesitter.language.add(lang) then
    return
  end
  vim.treesitter.start(buf, lang)
  if vim.treesitter.query.get(lang, 'indents') then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

local available = require('nvim-treesitter').get_available()
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then
      return
    end

    local installed = require('nvim-treesitter').get_installed 'parsers'
    if vim.tbl_contains(installed, lang) then
      try_attach(args.buf, lang)
    elseif vim.tbl_contains(available, lang) then
      require('nvim-treesitter').install(lang):await(function()
        try_attach(args.buf, lang)
      end)
    else
      try_attach(args.buf, lang)
    end
  end,
})
