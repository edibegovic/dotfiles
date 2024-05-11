local function custom_keymaps(bufnr)
  local api = require "nvim-tree.api"

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.del('n', 'f', { buffer = bufnr })
  vim.keymap.del('n', 'F', { buffer = bufnr })

  -- set hovering folder as current directory
  vim.keymap.set('n', '<leader>cd', function() require("nvim-tree.api").tree.change_root_to_node() end, { buffer = bufnr })

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
        width = 38,
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


    -- ------------------------------
    -- Auto close
    -- ------------------------------
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
          vim.cmd "quit"
        end
      end
    })
  end,
}

