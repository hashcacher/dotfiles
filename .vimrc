set encoding=utf-8
set signcolumn=yes

let mapleader = ","

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>v :e $MYVIMRC<CR>:source %<CR>
nnoremap <leader>p ywoprint("<Esc>pi is: " .. dump(<Esc>pi))<Esc> " Lua print
nnoremap <leader>d Oimport ipdb; ipdb.set_trace()<Esc>
"LUAnnoremap <leader>d o<Esc>idbg = dofile("/home/greg/code/piper-mods/piper/dev/debugger.lua")<CR>dbg()<Esc>
nnoremap <leader><leader> :find
nnoremap <leader>f :Rg 
nnoremap <leader>bd :Bdelete<CR>
nnoremap <C-p> :FZF<CR>

" -- coc.vim
nnoremap <leader>g <Plug>(coc-definition)
nnoremap <leader>r <Plug>(coc-references)
nnoremap <leader>n <Plug>(coc-rename)
nnoremap <leader>t <Plug>(coc-fix-current)
highlight YcmWarningSection guibg=#0fa000

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap gh :call ShowDocumentation()<CR>

inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" -- coc.vim

" vim-test
"nnoremap <leader>b :TestLast<CR>
" pytest
"nnoremap <leader>b :Pytest file<CR>
"nnoremap [q :Pytest previous<CR>
"nnoremap ]q :Pytest next<CR>
" make
"nnoremap <leader>n :AsyncRun -post :AsyncRun "sshpass -p piper ssh pi@10.1.10.202 sudo killall python<CR>" sshpass -p piper rsync -avz --exclude videos --exclude .git --exclude '*.dat' ~/code/piper/ pi@10.1.10.202:~/piper/<CR>
nnoremap <leader>n :AsyncRun sshpass -p piper rsync -avz --exclude .git --exclude '*.dat' ~/code/piperbak/ pi@10.1.10.202:~/piper/<CR>

nnoremap <leader>b :AsyncRun -rows=3 docker-compose restart ai<cr>

"nnoremap <leader>b :AsyncRun sshpass -p piper ssh -tt pi@10.1.10.150 screen -r<CR>
nnoremap <leader>s :AsyncStop<CR>:AsyncRun sshpass -p piper ssh pi@10.1.10.202 sudo killall python<CR>

" Normal mode
imap jk <Esc>

" dont show swap file message
set shortmess+=A

" Stolen from Alex Luecke
nmap B ^
nmap E g_
nnoremap <S-Tab> <<_
noremap <Tab> >>


" Colors
"colorscheme gotham
set termguicolors     " enable true colors support

" Utility
nnoremap <space> i<space><Esc>

" Adding newlines
nmap <CR> o<Esc>

" Per project vimrc
set exrc

" Use Spaces
set tabstop=4 
set expandtab
set shiftwidth=4
set autoindent
set smartindent

" Use tabs
"set noet ci pi sts=0 sw=4 ts=4

" Line numbering
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" File nav
set path+=**
set wildmenu

set nowrap

" Clipboard
set clipboard=unnamed

" HTML
runtime macros/matchit.vim

set listchars=tab:>-,eol:$,trail:.,extends:#

" ---- Plug
call plug#begin('~/.vim/plugged')
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itspriddle/vim-shellcheck'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mrk21/yaml-vim'
Plug 'hauleth/asyncdo.vim'
"Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/a.vim'
Plug 'leafgarland/typescript-vim'
Plug '907th/vim-auto-save'
Plug 'ruanyl/coverage.vim'
Plug 'vim-airline/vim-airline'
Plug 'fadein/vim-FIGlet'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-sleuth'
Plug 'morhetz/gruvbox'
"Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
"Plug 'Valloric/YouCompleteMe'
Plug '~/.vim/plugged/omnisharp-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
Plug 'skywind3000/asyncrun.vim'
call plug#end()
" ----- Plug

autocmd QuickFixCmdPost * :copen
let NERDTreeIgnore = ['\.pyc$']

let g:ctrlp_working_path_mode = 0

" Status line
let g:airline_section_x = ''
let g:airline_section_y = ''

"let newwidth = g:airline#extensions#default#section_truncate_width
"let newwidth.b = 100
"let g:airline#extensions#default#section_truncate_width = newwidth

let g:airline#extensions#tabline#enabled = 1

let g:vim_markdown_preview_github=1

" Quick fix
let g:asyncrun_open = 5
let g:qf_auto_open_quickfix = 0
"let g:qf_max_height = 20
let g:qf_auto_resize = 1

let $PYTHONUNBUFFERED=1

" Ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case --ignore="*.min.js"'
endif
let g:ctrlp_custom_ignore = '\v[\/](node_modules|DS_Store|\.git)|(\.(swp|ico|git|svn|pyc))$'

cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack


set runtimepath^=~/.vim/plugged/a.vim

" YCM IDE subcommands
"let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

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
function! s:MkNonExDir(file, buf)
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

"colorscheme beekai
set background=light
set bg=light
colorscheme gruvbox
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
map <silent> <F5> :call gruvbox#bg_toggle()<CR>

"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<CR>
nnoremap \2 :call RelatedFile ("views.py")<CR>
nnoremap \3 :call RelatedFile ("urls.py")<CR>
nnoremap \4 :call RelatedFile ("admin.py")<CR>
nnoremap \5 :call RelatedFile ("tests.py")<CR>
nnoremap \6 :call RelatedFile ( "templates/" )<CR>
nnoremap \7 :call RelatedFile ( "templatetags/" )<CR>
nnoremap \8 :call RelatedFile ( "management/" )<CR>
nnoremap \0 :e settings.py<CR>
nnoremap \9 :e urls.py<CR>

fun! RelatedFile(file)
    "This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun! SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()

let g:ale_set_signs = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 1000
let g:ale_linters = {
\   'javascript': ['eslint']
\}
let g:ale_fixers = {
\   'python': [
\       'trim_whitespace'
\   ],
\}
let g:ale_fix_on_save = 1

let test#python#runner = 'pytest'
let test#strategy = "asyncrun"

" Re-map FZF's Rg function to use ctrl-a/d instead of alt-a/d (no alt on mac)
if has('macunix')
  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>),
  \   1,
  \   {'options': fzf#vim#with_preview()["options"] + ['--bind', 'ctrl-a:select-all,ctrl-d:deselect-all']},
  \   <bang>0
  \ )
endif

set secure
