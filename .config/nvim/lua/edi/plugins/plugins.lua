return { 
  --{ 'mg979/vim-visual-multi' },
  { 'wellle/targets.vim' },
  { 'tpope/vim-commentary',
  config = function()
    vim.keymap.set('n', 's', 'gcc', { noremap = true, remap = true })
    vim.keymap.set('v', 's', 'gcgv', { noremap = true, remap = true })
  end
},
{ 'tpope/vim-surround' },
{ 'wellle/targets.vim' },
{ 'machakann/vim-highlightedyank',
config = function()
  vim.g.highlightedyank_highlight_duration = 100
end
},
{ 'petertriho/nvim-scrollbar',
  config = function()
    require('scrollbar').setup()
  end
},
{ 'stevearc/dressing.nvim' },
}
