" Leader 
let mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" Normal mode
imap jk <Esc>

" Stolen from Alex Luecke
nmap B ^
nmap E g_
nnoremap <S-Tab> <<_
noremap <Tab> >>

" Colors
colorscheme gotham

" Utility
nnoremap <space> i<space><Esc>

" Adding newlines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <C-Enter> i<CR><Esc>

" Filename
set laststatus=2
set statusline=%f "tail of the filename

" Tabs and indents
set tabstop=4 
set expandtab
set shiftwidth=4
set autoindent
set smartindent

" Line numbering
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" File nav
set path+=**
set wildmenu

colorscheme minimalist

" Clipboard
set clipboard=unnamedplus

" HTML
runtime macros/matchit.vim

" ---- Plug
call plug#begin('~/.vim/plugged')

" Python
"Plug 'davidhalter/jedi-vim'

" Ayu color scheme
" Plug 'ayu-theme/ayu-vim'

Plug 'tpope/vim-surround'
call plug#end()
" ----- Plug

" Ayu color scheme
" set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme cleanroom

"let g:jedi#popup_on_dot = 0
"let g:jedi#use_splits_not_buffers = 'bottom'
"let g:jedi#show_call_signatures = 0

" Persistent undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

