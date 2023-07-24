-- ---------------------------------------------
-- Neovide (GUI for Neovim)
-- ---------------------------------------------

vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_confirm_quit = 1
vim.g.neovide_input_use_logo = 1

vim.g.neovide_background_color = '#000000'
vim.g.neovide_transparency = 1.0
vim.g.transparancy = 0.0

-- Paste from clipboard with CMD + V
vim.keymap.set('', '<D-v>', '+p<CR>', {noremap = true, silent = true})
vim.keymap.set('!', '<D-v>', '<C-R>+', {noremap = true, silent = true})
vim.keymap.set('t', '<D-v>', '<C-R>+', {noremap = true, silent = true})
vim.keymap.set('v', '<D-v>', '<C-R>+', {noremap = true, silent = true})

-- Save with CMD + S
vim.keymap.set('', '<D-s>', ':w<CR>', {noremap = true, silent = true})
vim.keymap.set('i', '<D-s>', '<Esc>:w<CR>a', {noremap = true, silent = true})

-- ---------------------------------------------
-- Telescope
-- ---------------------------------------------
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      }
    }
  }
}


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', ":Telescope<CR>", {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

vim.keymap.set({ 'n', 'i', 'v' }, '<c-p>', builtin.find_files, {})
vim.keymap.set({ 'n', 'i', 'v' }, '<c-f>', builtin.oldfiles, {})
vim.keymap.set({ 'n', 'i', 'v' }, '<c-b>', builtin.buffers, {})

-- ---------------------------------------------
-- VimBufTabLine
-- ---------------------------------------------
vim.keymap.set("n", "<Tab>", ":bnext<CR>", {silent = true})
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", {silent = true})

-- Buftabline colors and other config (lua, neovim)
vim.g.buftabline_indicators = 1
vim.g.buftabline_numbers = 0

-- BufTabLineFill none
vim.api.nvim_set_hl(0, "BufTabLineFill", { fg = "#000000", bg = "none" })
vim.api.nvim_set_hl(0, "BufTabLineHidden", { fg = "#8c8c8c", bg = "none" })
vim.api.nvim_set_hl(0, "BufTabLineCurrent", { fg = '#EB4034', bg = "none" })
vim.api.nvim_set_hl(0, "BufTabLineActive", { fg = '#EB4034', bg = "none" })

-- ---------------------------------------------
-- Commentry
-- ---------------------------------------------

-- Comment with s
vim.keymap.set('n', 's', '<Plug>(comment_toggle_linewise_current)', {silent = true})
vim.keymap.set('v', 's', '<Plug>(comment_toggle_linewise_visual)gv', {silent = true})

-- ---------------------------------------------
-- Yank-highlighter
-- ---------------------------------------------

-- Blink durating
vim.g.highlightedyank_highlight_duration = 100

-- ---------------------------------------------
-- Surround
-- ---------------------------------------------

-- Use Q to discard everything inside/around the any surrounding (e.g. " or ( or {)
vim.keymap.set('n', 'q', ':ChangeInsideSurrounding<CR>', {silent = true})
vim.keymap.set('n', 'Q', ':ChangeAroundSurrounding<CR>', {silent = true})
--
-- ---------------------------------------------
-- Python REPL (slime)
-- ---------------------------------------------

-- Ignore VSCode and other editors
if vim.g.neovide == nil and vim.g.vscode == nil then
  vim.g.slime_target = "tmux"
  vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}
  vim.g.slime_target = "tmux"
  vim.g.slime_python_ipython = 1
  vim.g.slime_dont_ask_default = 1
  vim.g.slime_default_config = {
    socket_name = string.match(os.getenv("TMUX"), "^([^,]*)"),
    target_pane = "{top-right}"
  }

  vim.keymap.set({'n'}, '<CR>', '<Plug>SlimeParagraphSend', {silent = true})
  vim.keymap.set({'v'}, '<CR>', '<Plug>SlimeRegionSend', {silent = true})
  vim.keymap.set({'n'}, '<C-k>', ':SlimeSend1 %clear<CR>', {silent = true})
  vim.keymap.set({'n'}, '<C-v>', 'mq_viw<Plug>SlimeRegionSend `q', {silent = true})
  vim.keymap.set({'n'}, '<C-Enter>', '<Plug>SlimeSendCurrentLine', {silent = true})
end

-- ---------------------------------------------
-- Copilot
-- ---------------------------------------------
-- vim.g.copilot_filetypes = {'markdown': v:true}
vim.g.copilot_filetypes = {markdown = true}

-- ---------------------------------------------
-- UndoTree
-- ---------------------------------------------
-- Toggle undo tree with leader + u
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {silent = true})

-- Auto-focus on toggle
vim.g.undotree_SetFocusWhenToggle = 1

-- Auto-preview change on cursor move
vim.g.undotree_DiffAutoOpen = 1

-- Nicer symbols
 vim.g.undotree_TreeNodeShape = ''
vim.g.undotree_TreeVertShape = '│'
vim.g.undotree_TreeSplitShape = '╱'
-- vim.g.undotree_TreeReturnShape = '╲'

