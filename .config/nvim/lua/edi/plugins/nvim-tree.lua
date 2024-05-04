local function custom_keymaps(bufnr)
  local api = require "nvim-tree.api"

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.del('n', 'f', { buffer = bufnr })
  vim.keymap.del('n', 'F', { buffer = bufnr })
end

-- ------------------------------
-- Lazy Object 
-- ------------------------------
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1 
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true
    require("nvim-tree").setup({
  on_attach = custom_keymaps,
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
   
  -- map c-n to toggle nvim-tree
  vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

  -- nmap <leader>e to toggle focus on nvim-tree
  vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
  end,
}
