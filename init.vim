set encoding=utf-8

" Use vim-plug plugin manager
" Set plug-in folder
call plug#begin('~/.vim/bundle')

" Auto complete
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" highlight line
Plug 'itchyny/lightline.vim'
" Base16 color scheme
Plug 'chriskempson/base16-vim'
" Auto ctag plugin
Plug 'craigemery/vim-autotag'
" Number toggle plugin
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Latex plugin
Plug 'lervag/vimtex'
" Shortcut for comment line
Plug 'scrooloose/nerdcommenter'
" Smooth scroll plugin
Plug 'yuttie/comfortable-motion.vim'
" java autocomplete
Plug 'artur-shaik/vim-javacomplete2'
" color theme
Plug 'morhetz/gruvbox'
" Nerdtree
Plug 'scrooloose/nerdtree'
" Nerdtreetab
Plug 'jistr/vim-nerdtree-tabs'
" Tagbar
Plug 'majutsushi/tagbar'


" The following are examples of different formats supported.
" Keep Plugin commands between plug#begin/end.

" All of your Plugins must be added before the following line
call plug#end()            " required
"
" Brief help
" PlugInstall [name ...] [#threads]   -Install plugins
" PlugUpdate [name ...] [#threads]    -Install or update plugins
" PlugClean[!]                        -Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade                         -Upgrade vim-plug itself
" PlugStatus                          -Check the status of plugins
" PlugDiff                            -Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]       -Generate script for restoring the current snapshot of the plugins

"set compatiblelet mapleader=","       " leader is comma

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

"set nocompatible
set number
set cursorline
hi cursorline ctermbg=DarkGrey cterm=bold

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smarttab
set hlsearch
set smartindent
set autoindent
"display as much as can even if the line is not ended
set display=lastline
"set wrap and make j, k can work
set wrap
nnoremap j gj
nnoremap k gk
" noremap 0 g0
" noremap $ g$
vnoremap j gj
vnoremap k gk
"do not split work at the end of a line
set linebreak

"always display the status line
set laststatus=2

"file encoding.
set fileencodings=utf-8
"set fileencoding=utf-8,GB2312,GBK,GB18030
set termencoding=utf-8

set nofoldenable
set foldmethod=syntax
"set foldcolumn=1
setlocal foldlevel=99
"set foldclose=all
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zO')<CR>

"smali plugin configure
filetype plugin on
filetype indent on
"auto read when file is changed from outside
set autoread
"Set 7 lines to the cursor - when moving vertically using j/k
set so=7
syntax enable
" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Short cut to move between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

set complete+=kspell

set spelllang=en

" set list
" set lcs=trail:.

set lazyredraw

" turn off search highlight
let mapleader=","       " leader is comma
nnoremap <leader><space> :nohlsearch<CR>

" set B and E to go to the begining and end of line
nnoremap B g^
nnoremap E g$

" set pastetoggle to <leader>.(,.)
set pastetoggle=<leader>.

let base16colorspace=256  " Access colors present in 256 colorspace

" highlight extra space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set number relativenumber
set tags+=.tags;/

" disable preview window
set completeopt-=preview
" set ycm auto trigger
let g:ycm_auto_trigger=1

" disable vimtex compiler
let g:vimtex_compiler_enabled=0

" nerdcommenter setting
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" netrw setting
" set display style
let g:netrw_liststyle = 3
" set window size
let g:netrw_winsize = 20
" set open type
let g:netrw_browse_split = 3
" ,ft to open file tree in new tab
" nnoremap <leader>ft :tabnew<CR>:Ex<CR>
map <leader>ft <plug>NERDTreeTabsToggle<CR>

" ,t jump to tag in new tab
nnoremap <leader>t <C-w><C-]><C-w>T
" set to use clipboard for copy/paste
set clipboard+=unnamedplus

" javacomplete setting
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" auto import using F5
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

" coc.nvim config
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Fix autofix problem of current line
nmap <leader>f  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" gruvbox theme
let g:gruvbox_guisp_fallback = "bg" " fix spell error not displayed
colorscheme gruvbox
set background=dark

" open nerdtree on start
let g:nerdtree_tabs_open_on_console_startup = 1

" shortcut to open tagbar
nmap <leader>b :TagbarToggle<CR>
