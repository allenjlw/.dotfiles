set encoding=utf-8

" Use vim-plug plugin manager
" Set plug-in folder
call plug#begin('~/.vim/bundle')

" Auto complete
Plug 'Valloric/YouCompleteMe'
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
Plug 'terryma/vim-smooth-scroll'

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

set shiftwidth=4
set softtabstop=4
set tabstop=4
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
"do not split work at the end of a line
set linebreak

"always display the status line
set laststatus=2

"file encoding.
set fileencodings=utf-8
"set fileencoding=utf-8,GB2312,GBK,GB18030
set termencoding=utf-8

set foldenable
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
set tags+=tags;/

" disable vimtex compiler
let g:vimtex_compiler_enabled=0

" nerdcommenter setting
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
nnoremap <leader>ft :tabnew<CR>:Ex<CR>

"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END
