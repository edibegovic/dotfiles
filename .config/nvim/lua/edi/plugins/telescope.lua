return {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    },
    -- map c-f to find_files and leader-leader to commands
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup {
        defaults = {
          path_display = { 'smart' },
          mappings = {
            i = {
              ['<esc>'] = actions.close,
            },
          },
        },
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set('n', '<c-f>', '<cmd>Telescope find_files<cr>')
      vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>')
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
      vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
      vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope<cr>')
    end
  },
}
