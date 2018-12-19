" Vundle Settings and Plugins {{{
set nocompatible         "be improved , required
filetype off             "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are plugings we want.
" Keep Plugin commands between vundle#begin/end.

Plugin 'tComment'
Plugin 'molokai'
Plugin 'badwolf'
Plugin 'SearchComplete'
Plugin 'The-NERD-tree'
Plugin 'ctrlp.vim'
Plugin 'Syntastic'
Plugin 'fugitive.vim'
Plugin 'Auto-Pairs'
Plugin 'linediff.vim'
Plugin 'unimpaired.vim'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()         "required
filetype plugin indent on "required
" Put non-Plugin stuff after this line
" }}}

" Color Scheme {{{
syntax enable "enable syntax processing
" colorscheme molokai
colorscheme badwolf
" Make the gutters darker than the background
let g:badwolf_darkgutter=1
" Make the tab line lighter than the background.
let g:badwolf_tabline=3
" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight=1
" }}}

" Spaces and tabs {{{
set tabstop=4     "number of visual spaces per TAB
set shiftwidth=4  "indents will have a width of 8
set softtabstop=4 "number of spaces in tab when editing
set expandtab     "tabs are spaces
set autoindent
" }}}

" UI Config {{{
set textwidth=80
set colorcolumn=+1
set number        "show line numbers
set cursorline    "highlight current line
set showcmd       "show command in bottom bar
set lazyredraw    " redraw only when needed
set wildmenu      "visual autocoplete for command menu
set showmatch     "highlight matching [{()}]
" }}}

" Searching {{{
set incsearch     "search as characters are entered
set hlsearch      "highlight matches
"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable    "enable folding
set foldlevelstart=10 "open most folds by default
set foldnestmax=10    "10 nested fold max
"space open/close folds
nnoremap <space> za
set foldmethod=indent "fold based on indent level
"opne all folding zR
"close all folding zM
" }}}

" Leader Shortcuts {{{
" let mapleader=","    "leader key is comma
"jk is escape
"inoremap jk <ESC>
" }}}

" Mappings {{{
"set a map leader for more sane manner
let mapleader=','
"set cursor to the front of line in edit mode
inoremap <leader>e <ESC>E
"set cursor to the end of line in edit mode
inoremap <leader>a <ESC>A
"shortcut to insert a new line on top of the current line in edit mode
inoremap <leader>q <ESC>O
"shortcut to insert a new line below the current line in edit mode
inoremap <leader>z <ESC>o
"close the current buffer
noremap <leader>q :q<cr>
"shortcut to save
nmap <leader>w :w<cr>
"edit ~/.vimrc
map <leader>ev :e! ~/.vimrc<cr>
"edit dotfiles
map <leader>df :e! ~/dotfiles<cr>
"scroll the viewport faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

"active spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" Movement {{{
"move vertically by visual line
nnoremap j gj
nnoremap k gk
"move to beginning/end of line
nnoremap B ^
nnoremap E $
"highlight last inserted text
nnoremap gV `[v`]
"movement between windows
" nnoremap <C-J> <C-W>w
" nnoremap <C-L> <C-W>l
" nnoremap <C-H> <C-W>h
" nnoremap <C-K> <C-W>W
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
" }}}

" }}}

" Manipulation Hard to Remember {{{
"resize horizontal split window {{{{
":vertical resize +/- 5 }}}}
"resize vertical split window {{{{
":resize +/- 5 }}}}
" }}}

" Plugins {{{
"Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
" }}}
" NERDTree {{{
" "show hidden files in NERDTree
" let NEARDTreeShowHidden=1
"using NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" }}}
" CtrlP {{{
nmap <silent> <leader>r :CtrlPBuffer<cr>
" }}}
" Linediff {{{
noremap <leader>lt :Linediff<CR>
noremap <leader>lto :LinediffReset<CR>
" }}}
"AutoPairs {{{
let g:AutoPairsShortcutToggle='<leader>p'
"}}}
"Vim-go {{{
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
nnoremap <leader>a :cclose<CR>
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_autosave = 1
let g:go_def_mode = 'godef'
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"}}}
" }}}

" Functions {{{
"window movement shortcuts
"move to the window in the directin shown, or create a new window
function! WinMove(key)
        let t:curwin = winnr()
        exec "wincmd ".a:key
        if (t:curwin == winnr())
                if (match(a:key, '[jk]'))
                        wincmd v
                else
                        wincmd s
                endif
                exec "wincmd ".a:key
        endif
endfunction
"add c header files
function! s:insert_gates()
          let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
            execute "normal! i#ifndef " . gatename
              execute "normal! o#define " . gatename . " "
               execute "normal! o"
               execute "normal! o"
                execute "normal! Go#endif /* " . gatename . " */"
                  normal! kk
          endfunction
          autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
" }}}

" Daily plan markdown {{{
" Auto add models
autocmd BufNewFile *Plan.md r ~/Documents/Plans/Models/2016_01_model.md
" }}}

" Organization {{{
set modelines=3
" vim: foldmethod=marker: foldlevel=0:


