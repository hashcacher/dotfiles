" Leader 
let mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>e :e<cr>
nnoremap <leader>p ywoprint("<Esc>pi is: " .. dump(<Esc>pi))<Esc> " Lua print
nnoremap <leader>d o<Esc>idbg = dofile("/home/greg/code/piper-mods/piper/dev/debugger.lua")<cr>dbg()<Esc>
nnoremap <leader><leader> :find 
nnoremap <leader>f :Ack 

" Normal mode
imap jk <Esc>

" Stolen from Alex Luecke
nmap B ^
nmap E g_
nnoremap <S-Tab> <<_
noremap <Tab> >>


" Colors
"colorscheme gotham
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme cleanroom

" Utility
nnoremap <space> i<space><Esc>

" Adding newlines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <C-Enter> i<CR><Esc>


" Per project vimrc
set exrc

" Filename
set laststatus=2
set statusline=%f%{fugitive#statusline()} "tail of the filename

" Use Spaces
"set tabstop=4 
"set expandtab
"set shiftwidth=4
"set autoindent
"set smartindent

" Use tabs
set noet ci pi sts=0 sw=4 ts=4

" Line numbering
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" File nav
set path+=**
set wildmenu

set nowrap

" Clipboard
set clipboard=unnamedplus

" HTML
runtime macros/matchit.vim

" Python
"nmap <leader>d oimport pdb; pdb.set_trace()<Esc>

" ---- Plug
call plug#begin('~/.vim/plugged')
" Ayu color scheme
" Plug 'ayu-theme/ayu-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'flazz/vim-colorschemes'
"Plug 'nightsense/simplifysimplify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'Valloric/YouCompleteMe'
Plug '~/.vim/plugged/omnisharp-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'

"Plug 'xolox/vim-lua-ftplugin'
"Plug 'xolox/vim-misc'
call plug#end()
" ----- Plug
"
" Ack.vim
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack


set runtimepath^=~/.vim/plugged/a.vim

" YCM IDE subcommands
nnoremap <leader>g :YcmCompleter GoTo<CR> 
nnoremap <leader>r :YcmCompleter GoToReferences<CR> 
highlight YcmWarningSection guibg=#0fa000
let g:ycm_python_binary_path = '/usr/bin/python'

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


" Create non-existent directories on save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Lua debug
function! EasyDebug()
" CLEAR REGISTERS

let reg_n = 'z'
let reg = '"'.reg_n
let reg_save = getreg(reg)
let reg_type = getregtype(reg)
" yank until space
silent exe 'norm! '.reg.'yt '
let value = getreg(reg)
" look for : inside of value
if value =~ ":"
	let value = split(value, ":")[0]
end
" if no space found, look for =
if len(value)<2
	" yank until =
	silent exe 'norm! '.reg.'yt='
	let value = getreg(reg)

	" if no = found, look for :
	if len(value)<2
		" yank until =
		silent exe 'norm! '.reg.'yt:'
		let value = getreg(reg)

		" if no =, yank until end of line
		if len(value)<2
			silent exe 'norm! '.reg.'y$'
			let value = getreg(reg)
		endif
	endif
endif
echo value
silent exe "norm! oprint(\"".value." is: \" .. ".value.")\<esc>"
exe 'let @'.reg_n.' = ""'
endfun

colorscheme beekai
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

set secure


