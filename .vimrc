""" vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'
Plug 'psliwka/vim-smoothie'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()
"""

let g:deoplete#enable_at_startup = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Use system clipboard (w gvim)
set clipboard=unnamed

" Enable true colors (24 bit)
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Disable background color and inherit from terminal
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
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
set shiftwidth=0

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
set relativenumber
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
"    hi CursorLine cterm=NONE ctermbg=darkgrey
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

"   File explorer
let g:netrw_liststyle = 3   " viw as tree
let g:netrw_banner = 0      " remove banner


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

" Spellcheck
map <F6> :setlocal spell! spelllang=en_us<CR>

" Save in insert mode
inoremap <F3> <c-o>:w<cr>

" Swap the word the cursor is on with the next word (which can be on a
" newline, and punctuation is "skipped"):
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>

" Let left/right movement wrap between lines
set whichwrap+=<,>,h,l,[,]

" Compile markdown with pandoc on F9
" Taken from https://vi.stackexchange.com/questions/17549/using-pandoc-with-vim-keybindings
nnoremap <buffer><nowait><silent> <F9> :<c-u>silent call system('pandoc '.expand('%:p:S').' -o '.expand('%:p:r:S').'.pdf')<cr>
