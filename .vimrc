""" vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'
call plug#end()
"""

" clipboard
set clipboard=unnamed

" Enable true colors (24 bit)
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Colorscheme options
syntax on
set t_Co=256
set cursorline
colorscheme onedark
let g:airline_theme='onedark'

"   Spaces, tabs and indentation
set autoindent          " new lines inherit indentation
set tabstop=4	    	" number of visual spaces per TAB
set softtabstop=4 	    " number of spaces in tab when editing
set expandtab		    " tabs are spaces
set smarttab            " insert 'tabstop' number of spaces w/tab

"   Search
set hlsearch            " enable search highlighting
set ignorecase          " ignore case when searching
set smartcase           " switch search to case sensitive when using uppercase chars
set incsearch           " enable incremental search (as characters are typed)


"   Text rendering
syntax enable
set display+=lastline   " always try to show paragraphs' last line
set encoding=utf-8      " use unicode encoding
set linebreak           " avoid wrapping line in middle of word
set scrolloff=1         " set number of lines to keep above/below cursor

"   Colors
" highlight last inserted text:
nnoremap gV `[v`]

"   UI
set title               " set window title to file being edited
set background=dark     " use colors that suit a dark background
set laststatus=2        " always display status bar
set ruler               " always display cursor position
set number              " show line numbers
"highlight LineNr ctermfg=darkgrey
"set relativenumber
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
"    hi CursorLine cterm=NONE ctermbg=darkgrey
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

"   Misc
set history=1000        " set undo limit


"   Runtimepath
"   set runtimepath^=~/.vim/bundle/vim-stata.vim
runtime! archlinux.vim

" Path to Stata - Set either one of these but not both. Paste in the path with the executable filename
"	Example: On Linux, /usr/local/stata15/xstata for Stata 15
" -- Option (1): Path to the Stata binary (including the executable name)
let g:vimforstata_pathbin = "/usr/local/stata15/xstata-mp"

" Powerline font symbols for statusline
let g:airline_powerline_fonts = 1

" vimtex parameters
let g:vimtex_view_method = 'zathura'
