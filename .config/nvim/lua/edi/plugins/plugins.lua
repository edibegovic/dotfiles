return { 
  { 'mg979/vim-visual-multi' },
  { 'wellle/targets.vim' },
  -- commentry and map s (in normal mode) to gcc and in visual mode to gc
  { 'tpope/vim-commentary',
    config = function()
      vim.api.nvim_set_keymap('n', 's', 'gcc', { noremap = true })
      vim.api.nvim_set_keymap('v', 's', 'gc', { noremap = true })
    end
  },
  { 'tpope/vim-surround' },
  { 'wellle/targets.vim' },
  { 'machakann/vim-highlightedyank',
    config = function()
      vim.g.highlightedyank_highlight_duration = 100
    end
  },
}
