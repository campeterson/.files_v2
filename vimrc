"""execute pathogen#infect()
syntax on
filetype plugin indent on

set backspace=indent,eol,start

" map leader key to ','
let mapleader = ","
let g:mapleader = ","

" Make current line visible
set cursorline

" Large history
set history=1000

" Highlight search results
set hlsearch
" Leader / to remove highlighted search fields
nnoremap <leader>/ :nohlsearch<cr>

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
" Leader p to pbpaste from clipboard
nnoremap <leader>p :r !pbpaste<cr>

" Show matches as search is typed
set incsearch

" Setting for whitespace visualization
set list
set listchars=trail:·,tab:\ \

" http://georgebrock.github.io/talks/vim-completion/
" Show line numbers
set number
" Show relative line numbers
set relativenumber

" Show line, column, %, at bottom of window
set ruler

" Scroll 3 lines instead of 1 when cursor goes off screen
set scrolloff=3

" Current mode is displayed on bottom line
set showmode

" Set tabstop/shiftwidth for different files
autocmd Filetype html setlocal ts=2 sts=2 sw=2 et
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
"autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype python setlocal ts=8 sts=4 sw=4 tw=79 et ai ff=unix

" Support .boot and .hl files
autocmd BufNewFile,BufRead *.hl     set filetype=clojure
autocmd BufNewFile,BufRead *.boot   set filetype=clojure
autocmd BufNewFile,BufRead *.build  set filetype=clojure

" Default tabstop/shiftwidth
set tabstop=2
set shiftwidth=2
set expandtab

colorscheme vilight-cterm

" Highlight 80 char
highlight ColorColumn ctermbg=darkgray
call matchadd('ColorColumn', '\%81v', 100)

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"https://github.com/hashivim/vim-terraform
Plug 'hashivim/vim-terraform'

"https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd= 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=*/tmp/*,*/target/*,*/compiled*

" " One of following
" Plug 'ctrlpvim/ctrlp.vim
" Plug 'junegunn/fzf'
" Plug 'liuchengxu/vim-clap'

" Requires
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-asyncomplete', {'for': 'clojure'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

" Enable vim-iced's default key mapping
" This is recommended for newbies
let g:iced_enable_default_key_mappings = v:true

"https://github.com/chrisbra/csv.vim/
Plug 'chrisbra/csv.vim'
"https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'
"https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

"https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ack!
cnoreabbrev Ag Ack!

"https://github.com/edkolev/tmuxline.vim
Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

"https://github.com/jgdavey/tslime.vim
Plug 'jgdavey/tslime.vim'
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

"https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
" show vim-airline status by default
set laststatus=2
" more vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline_powerline_fonts = 1
let g:airline_theme='lucius'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"https://github.com/vim-airline/vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

"https://github.com/vim-scripts/paredit.vim
Plug 'vim-scripts/paredit.vim'
"https://github.com/kien/rainbow_parentheses.vim
Plug 'kien/rainbow_parentheses.vim'
"https://github.com/guns/vim-clojure-highlight
Plug 'guns/vim-clojure-highlight'
"https://github.com/tpope/vim-dispatch
Plug 'tpope/vim-dispatch'
"https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
"https://github.com/tpope/vim-salve
Plug 'tpope/vim-salve'
"https://github.com/ap/vim-css-color
Plug 'ap/vim-css-color'

"https://github.com/previm/previm
Plug 'previm/previm'
let g:previm_open_cmd = 'open -a Safari'
let g:previm_enable_realtime = 1
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"https://github.com/justinmk/vim-sneak
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

"https://github.com/junegunn/limelight.vim
Plug 'junegunn/limelight.vim'

"https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=3
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"comment about autocmd!

"https://github.com/roman/golden-ratio
Plug 'roman/golden-ratio'



" Initialize plugin system
call plug#end()
