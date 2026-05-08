" Shared editor behavior.
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cmdheight=2
set laststatus=2
set wildmenu
set wildmode=longest:full,full
set splitright
set splitbelow
set scrolloff=4
set sidescrolloff=8
set nowrap
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set autoindent
set smartindent
set backspace=indent,eol,start
set clipboard=

" Default indentation. Language-specific files can override with setlocal.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Line visibility.
set number
set relativenumber
set cursorline

" Color theme. The package is installed by install-plugins.sh; keep a quiet
" fallback so Vim still opens before plugins are installed.
if has('termguicolors')
  set termguicolors
endif
set background=dark
silent! packadd vim-code-dark
try
  colorscheme codedark
catch /^Vim\%((\a\+)\)\=:E185/
endtry

" Keep the terminal background visible instead of forcing the theme background.
highlight Normal term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight NormalNC term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight SignColumn term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight LineNr term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight FoldColumn term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight EndOfBuffer term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight VertSplit term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight StatusLine term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
highlight StatusLineNC term=NONE cterm=NONE ctermbg=NONE gui=NONE guibg=NONE

" Terminal Vim cannot make a single highlight group translucent; use a subtle
" gray cursor line that works well with translucent terminal windows.
highlight CursorLine term=NONE cterm=NONE ctermbg=238 gui=NONE guibg=#3a3a3a
highlight CursorLineNr term=bold cterm=bold ctermfg=250 ctermbg=238 gui=bold guifg=#bcbcbc guibg=#3a3a3a

" Cleaner whitespace display.
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<

" Leader keys.
let mapleader = ' '
let maplocalleader = ','

" Basic navigation helpers.
nnoremap <silent> <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>w :write<CR>
nnoremap <silent> <leader>q :quit<CR>
