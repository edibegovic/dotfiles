-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- break lines on words
vim.opt.linebreak = true

-- No search highlight
vim.opt.hlsearch = false

-- Enable full color
vim.opt.termguicolors = true

-- turn on mouse support
vim.opt.mouse = 'a'

-- Ignore case
vim.opt.ignorecase = true

-- Use <backspace> to delete in insert mode
vim.opt.backspace = "indent,eol,start"

--  Use <Del> to delete forwards in insert mode 
vim.keymap.set("i", "<C-d>", "<Del>")

-- set title of terminal window to current file
vim.opt.title = true

-- Margin (line) above and below cursor
vim.opt.scrolloff = 4

-- More natural split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Auto-loads buffer contents if changes are made outside of Vim
vim.opt.autoread = true

-- Don't show current mode
vim.cmd "set noshowmode"

-- No annoying sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false

-- shortmess, don't show save confirmation
vim.opt.shortmess:append('c')

-- Yank into system clipboard
-- vim.opt.clipboard:append('unnamedplus')

-- Add cursor line
vim.opt.cursorline = true

-- Wrap lines
vim.opt.wrap = true
vim.opt.textwidth = 80

-- misc
vim.opt.cmdheight = 1

-- ---------------------------------------------
-- Key mappings
-- ---------------------------------------------

-- <Space> as leader
vim.g.mapleader = " "

-- Basic navigation
if vim.g.vscode then
  vim.keymap.set('n', 'k', ":call VSCodeNotify('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': 1 })<CR>", { noremap = true, silent = true })
  vim.keymap.set('n', 'j', ":call VSCodeNotify('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': 1 })<CR>", { noremap = true, silent = true })
else
  vim.keymap.set('n', 'j', 'gj', { silent = true })
  vim.keymap.set('n', 'k', 'gk', { silent = true })
end

-- use J/K to jump between paragraphs
vim.keymap.set({'n', 'v'}, 'J', 'j}<BS>0')
vim.keymap.set({'n', 'v'}, 'K', 'k{<Space>0')

-- go to begining and end of line with H and L
-- vim.keymap.set({'n', 'v'}, 'H', '_')
-- vim.keymap.set({'n', 'v'}, 'L', '$h')
--
vim.keymap.set({'n', 'v'}, 'H', 'g0')
vim.keymap.set('n', 'L', 'g$')
vim.keymap.set('v', 'L', 'g$h') -- don't select newline in visual mode

-- delete line with capital D instead of dd
vim.keymap.set('n', 'D', 'dd')
vim.keymap.set('n', 'dd', 'D')

-- Smart-quit vim (and save)
local function smart_buffer_close()
  local buflisted = vim.fn.getbufinfo({buflisted = 1})
  if #buflisted > 1 then
    -- Switch to the previous buffer
    vim.cmd('bprevious')
    -- Delete the alternate buffer (which is the one we were originally on)
    vim.cmd('confirm bd#')
  else
    -- If it's the last buffer, just delete it
    vim.cmd('confirm bd')
    -- and quit
    vim.cmd('q')
  end
end

-- Setting up the keymapping in normal mode 
vim.keymap.set('n', '<leader>q', smart_buffer_close, {desc = "Smart close buffer"})
vim.keymap.set('n', 'Q', smart_buffer_close, {desc = "Smart close buffer"})

-- quit all
vim.keymap.set('n', '<leader>Q', ':qa!<CR>')


-- Use æ to acess command mode
-- vim.keymap.set('n', 'æ', ':')

-- Yank to system clipboard
vim.keymap.set('v', 'Y', '"*y')

-- Save with CMD + S
vim.keymap.set('n', '<leader>w', ':w<CR>', {silent=true})
vim.keymap.set({'n', 'v'}, '<M-s>', ':w<CR>', {silent=true})
vim.keymap.set('i', '<M-s>', '<Esc>:w<CR>a', {silent=true})

-- Clear output with escape
vim.keymap.set('n', '<Esc>', ':echo ""<CR>')

-- Open file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Search with f
vim.keymap.set({'n', 'v'}, 'f', '/')
vim.keymap.set({'n', 'v'}, 'F', '?')

-- Only search visible text on screen (not the whole file)
vim.keymap.set('n', 'å', "VHoL<Esc>``/", {noremap=true})

-- Select all
vim.keymap.set('n', '<leader>a', 'ggVG')

-- Go to mark exact position instead of line
vim.keymap.set('n', "\'", '`^')

-- Repeat . command over multiple visual lines
vim.keymap.set('v', '.', ':norm.<CR>')

-- Use tab to switch buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')

-- Use tab in indent visual selection
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')

-- Delete single charecter without saving to register
vim.keymap.set({'n', 'v'}, 'x', '"_x')

-- Don't yank on paste in visual mode
vim.keymap.set('v', 'p', '"_dP')

-- File explorer with <leader>e
vim.keymap.set('n', '<leader>s', ':so<CR>')

-- scroll 4 lines with ctrl + u/d
vim.keymap.set('n', '<C-u>', '4<c-y>')
vim.keymap.set('n', '<C-d>', '4<c-e>')

-- don't put character in register when deleting with x
vim.keymap.set('n', 'x', '"_x')

-- emit holding down shift for charecter text objects
vim.keymap.set('n', 'vi2', 'vi"')
vim.keymap.set('n', 'yi2', 'yi"')

--  Use <C-hjkl> to move between panes
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
-- cim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')

-- toggles
vim.keymap.set('n', '<leader>tw', ':set wrap!<CR>')
vim.keymap.set('n', '<leader>tln', ':set number!<CR>')

