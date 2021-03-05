" ~/.config/nvim/init.vim

call plug#begin("~/.vim/plugged")
	Plug 'itchyny/lightline.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'evanleck/vim-svelte', {'branch': 'main'}
	Plug 'glench/vim-jinja2-syntax'
	Plug 'preservim/nerdcommenter'
	Plug 'gko/vim-coloresque'
    Plug 'neoclide/coc.nvim'
    Plug 'sbdchd/neoformat'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

colorscheme atom-dark
syntax enable

let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable mouse support
set mouse=a

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
noremap <C-n> :call TermToggle(12)<CR>
inoremap <C-n> <Esc>:call TermToggle(12)<CR>
tnoremap <C-n> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Move to editor window by default
autocmd vimenter * wincmd l

" Open insert mode by default
autocmd BufRead,BufNewFile * start

" Ctrl+C to copy line
noremap <C-C> yyi
inoremap <C-C> <Esc>yyi
" Ctrl+X to cut line
noremap <C-X> ddi
inoremap <C-X> <Esc>ddi
" Ctrl+V to paste
noremap <C-V> pi
inoremap <C-V> <Esc>pi
" Ctrl-D to duplicate line
noremap <C-D> yypi
inoremap <C-D> <Esc>yypi
" Ctrl+Z to undo
noremap <C-Z> ui
inoremap <C-Z> <Esc>ui

" Toggle nerdtree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
inoremap <silent> <C-b> <Esc>:NERDTreeToggle<CR>i
" Ctrl+S to save
noremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>
" Ctrl+Q to quit
noremap <C-Q> :q!<CR>
inoremap <C-Q> <Esc>:q!<CR>
" Ctrl+E to jump to editor
noremap <C-E> <Esc><C-W>li
" Ctrl+W to jump to 
" Ctrl+F to find
noremap <C-F> /
inoremap <C-F> <Esc>/

" Ctrl+/ to comment
imap <C-_> <Esc><Leader>c<space>i
vmap <C-_> <Plug>NERDCommenterToggle

" TODO: A function to copy the whole text to clipboard

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ ['mode', 'paste'],
	\             ['fugitive', 'readonly', 'filename', 'modified'] ],
	\   'right': [ [ 'lineinfo' ], ['percent'] ]
	\ },
	\ 'component': {
	\   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
	\   'modified': '%{&filetype=="help"?"":&modified?"\ue0a0":&modifiable?"":"-"}',
	\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	\ },
	\ 'component_visible_condition': {
	\   'readonly': '(&filetype!="help"&& &readonly)',
	\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
	\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
	\ },
	\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
	\ }

set tabstop=4
set shiftwidth=4
set expandtab

" Hack
let g:loaded_clipboard_provider = 1

