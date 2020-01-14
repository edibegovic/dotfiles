" Reload eonfiguration with :so %

" Set leader to <space>
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" ~~~aestethics~~~ 
set background=dark
colorscheme gruvbox

call plug#begin()
Plug 'morhetz/gruvbox' " Primary color scheme
Plug 'easymotion/vim-easymotion' " move lines by reference
Plug 'rhysd/clever-f.vim' " use f as repeat instead of , ;
Plug 'wellle/targets.vim' " e.g. ci( outsode of actual text object
Plug 'terryma/vim-multiple-cursors' " adds VS Code like CMD+D to <C-n>  
Plug 'tpope/vim-commentary' " cg to comment/uncomment visual block
Plug 'tpope/vim-surround' " use S' in visual block
Plug 'briandoll/change-inside-surroundings.vim' " Common 'change in <surrounding>'
Plug 'machakann/vim-highlightedyank' " Highlight yanked region
Plug '/usr/local/opt/fzf' " FZF fuzzy finder
Plug 'junegunn/fzf.vim' " Vim functionality to FZF
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Auto-completion
Plug 'edix0009/vim-sayonara' " Quit vim when last buffer is closed
Plug 'tmsvg/pear-tree' " Auto-close breackets
Plug 'deathlyfrantic/vim-buftabline', { 'branch': 'experimental-config-function' }
Plug 'jpalardy/vim-slime',
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
call plug#end()

" Select all occurances of word under cursor (multi-cursor)
let multi_cursor_select_all_word_key = '<C-#>'
map <leader>n <C-#>

map <c-b> ``
noremap gb ``

" reselect the pasted region with `gb`
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Don't un-select text after number increment
vnoremap <C-a> <C-a>gv

" Switch buffers without saving file
set hidden

" Margin (line) above and below cursor
set scrolloff=2

set nocompatible
filetype off

" Switch between windows
map <C-w> <C-w>w

" Switch buffers with TAB
nnoremap <silent><Tab> :bnext<CR>
nnoremap <silent><S-Tab> :bprev<CR>

" More natural split behavior in Vim
set splitbelow
set splitright

" use TAB and Enter for coc autocomplte
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" FZF should use dropbox as main index
map <c-space> :FZF ~/Dropbox<cr>
map <c-f> :Files <C-R>=expand('%:h')<CR><CR>


" More FZF shortcuts
nnoremap <silent> <leader>o :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>c :Commands<cr>

"use J/K to more between paragraphs
nnoremap K k{<Space>0
vnoremap K k{<Space>0
nnoremap J j}<BS>0
vnoremap J j}<BS>0

" Append below line without adding space
noremap gj gJ

" Select all
noremap <leader>a ggVG

" repat with leader r or ø
map <leader>r .
map ø .

" Go to mark exact position instead of line
noremap ' `

"save with leader w
noremap <silent> <leader>w :w<CR>
noremap <leader>q :Sayonara<CR>
noremap <leader>Q :q!<CR>

"auto-close breackets with Å
imap Å <Plug>(pairify-complete)

" map Enter to : (command)
noremap <Enter> :

" delete line with capital D instead of dd
nnoremap D dd
nnoremap dd D

" Toggle comment with <leader>c (and s)
nmap <leader>c gccg;
vmap <leader>c gcg;
nmap s gcc
vmap s gcgv

" go to begining and end of line with H and L
map H _
map L $

" CMD+S to save in iTerm2
nnoremap <silent><F6> :w<CR>
inoremap <silent><F6> <Esc>:w<CR>

" Save with <leader>w
noremap <leader>w :w<CR>

" Ignore case in seach
set ignorecase

" Ignore case on f/t
let g:clever_f_chars_match_any_signs = 'å'
let g:clever_f_smart_case = 1

" Don't invert colors in visual selection
let g:gruvbox_invert_selection=0

" Use <backspace> to delete in insert mode
set backspace=indent,eol,start
noremap <BS> x

" Use <Del> to delete forwards in insert mode
inoremap <C-d> <Del>

" Syntax highlight
syntax on

" gruvbox ~~~aestethics~~~
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=grey ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi EndOfBuffer ctermfg=237 ctermbg=235

" Buftabline colors and other config
hi BufTabLineFill ctermfg=NONE ctermbg=NONE
hi BufTabLineHidden ctermfg=245 ctermbg=NONE
hi BufTabLineCurrent ctermfg=167 ctermbg=NONE
hi BufTabLineActive ctermfg=245 ctermbg=NONE
let buftabline_indicators = 1
set cmdheight=3

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
autocmd StdinReadPre * let s:std_in=1

" Remap search
map <leader>j /
map <leader>k ?

" No delay on escape
set timeoutlen=1000 ttimeoutlen=0

" iTerm2 cursor change normal/visual/insert mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Use Q to repeat q macro
nnoremap Q @q
" Repeat @q command over multiple visual lines
vnoremap q :'<,'>:normal @q<CR>
" Repeat . command over multiple visual lines
vnoremap . :normal .<CR>

" Use tab in indent visual selection
vmap <Tab> >gv
vmap <S-Tab> <gv

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

nnoremap gV `[v`]

" Ask for for save confirmation on quit
set confirm

" Delete without saving to clipboard/register
nnoremap x "_x
vnoremap x "_x

" Auto-loads open file if changes are made in other programs
set autoread

" Do not redraw screen in the middle of a macro. Makes them complete faster.
set lazyredraw

" enables mouse support in many terminal emulators
if has('mouse')
  set mouse=a
endif

" No search highlight
set nohlsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Access vimrc with <leader>e
map <leader>e :e! ~/.vimrc<cr>

 " highlight duration of yanks
let g:highlightedyank_highlight_duration = 80

" FZF to use Gruvbox colorscheme
let g:fzf_colors = {
    \ 'fg':      ['fg', 'GruvboxGray'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'GruvboxRed'],
    \ 'fg+':     ['fg', 'GruvboxBlue'],
    \ 'bg+':     ['bg', 'GruvboxBg1'],
    \ 'hl+':     ['fg', 'GruvboxRed'],
    \ 'info':    ['fg', 'GruvboxOrange'],
    \ 'prompt':  ['fg', 'GruvboxBlue'],
    \ 'header':  ['fg', 'GruvboxBlue'],
    \ 'pointer': ['fg', 'Error'],
    \ 'marker':  ['fg', 'Error'],
    \ 'spinner': ['fg', 'Statement'],
    \ }

" Lets you move the tail of a selection (visual mode) by holding down control
function! DreamyMoveVisualTail(movement) abort
    let tail_pos = getpos('v')
    let tail_line_num = tail_pos[1]
    let tail_column_num = tail_pos[2]
    execute "normal! \<esc>"
    let start_pos = getpos("'<")
    let end_pos = getpos("'>")
    let end_line_num = end_pos[1]
    let end_column_num = end_pos[2]
    if tail_line_num != end_line_num || tail_column_num != end_column_num
        let head_pos = end_pos
    else
        let head_pos = start_pos
    endif
    call setpos('.', tail_pos)
    execute 'normal ' . a:movement
    normal! v
    call setpos('.', head_pos)
endfunction

vnoremap <C-h> <Cmd>call DreamyMoveVisualTail('h')<CR>
vnoremap <C-l> <Cmd>call DreamyMoveVisualTail('l')<CR>
vnoremap <C-b> <Cmd>call DreamyMoveVisualTail('b')<CR>
vnoremap <C-w> <Cmd>call DreamyMoveVisualTail('w')<CR>
vnoremap <C-e> <Cmd>call DreamyMoveVisualTail('e')<CR>
vnoremap <C-j> <Cmd>call DreamyMoveVisualTail('j')<CR>
vnoremap <C-k> <Cmd>call DreamyMoveVisualTail('k')<CR>

" Move between splits ("windows") with CTRL-<HJKL>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ignore the stupid command window (and Ex)
nnoremap q: <Nop>
nnoremap Q <nop>

" Yank selection to system clipboard
noremap <Leader>y "*y

set fillchars=vert:┃ " for vsplits
set fillchars+=fold:· "for folds
hi VertSplit guifg=#FF5C8F
" set number

let slime_target = 'tmux'
let slime_python_ipython = 1
let slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let slime_dont_ask_default = 1
map <Leader>m <C-c><C-c>
map <Enter> <C-c><C-c>
noremap <silent> <C-k> :IPythonCellClear<CR>
noremap <silent> <Leader>k :IPythonCellClear<CR>
noremap <silent> <Leader>v viw<C-c><C-c>

let g:kite_snippets=0
