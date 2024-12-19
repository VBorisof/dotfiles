if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

""""""""""""""""""""""""""""""""""""""""
" SETUP  
""""""""""""""""""""""""""""""""""""""""
filetype plugin on

" let g:gutentags_ctags_extra_args = ['--tag-relative', '--fields=+l', '--extras=+q', '--regex-c=/TODO/']

set encoding=utf-8
set fileencoding=utf-8

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

"" Fix backspace indent
set backspace=indent,eol,start

set softtabstop=0
set shiftwidth=4
set expandtab

set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set relativenumber
set nu rnu
set nowrap
set numberwidth=4

set clipboard=unnamedplus

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
" let g:lsc_server_commands = {'dart': 'dart_language_server'}
" let g:lsc_auto_map = v:true

set completeopt=longest,menuone
setlocal omnifunc=go#complete#Complete

"let f:OmniSharp_highlighting = 2

set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow
set splitright

filetype indent on
set autoindent


set directory=~/.vimbackups//
set backupdir=~/.vimbackups//
set undodir=~/.vimbackups//

" Session Management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

set wildmenu

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
inoremap <silent><expr> <C-Space> coc#start()
"inoremap <silent> <C-i> <Esc>:call CocActionAsync('showSignatureHelp')<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'OmniSharp/omnisharp-vim'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'chrisbra/Colorizer'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'beyondmarc/hlsl.vim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'
"" Vim-Session
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'

"" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

"Plug 'majutsushi/tagbar'
"Plug 'ludovicchabant/vim-gutentags'

"Plug 'SirVer/ultisnips'

"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"" Go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


Plug 'rktjmp/lush.nvim'

packadd cfilter

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" KEYMAPS
""""""""""""""""""""""""""""""""""""""""
map <O> O<Esc>

let no_buffers_menu=1
nmap <S-l> :bn<CR>
nmap <S-h> :bp<CR>
map qb :bn<CR>:bd #<CR>

nnoremap <C-l> :vertical resize +5<CR> 
nnoremap <C-h> :vertical resize -5<CR> 
nnoremap <C-k> :res +5<CR>
nnoremap <C-j> :res -5<CR>

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

nmap <C-a> GVgg
map <C-Del> dd
map <C-d> Vyp

nmap <F2> :NERDTree<CR>

nmap <silent> <C-B> <Plug>(coc-definition)
nmap <silent> <F12> <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)

let g:ctrlp_map = '<C-T>'
let g:ctrlp_cmd = 'CtrlP'

vnoremap p "_dP

nmap ]] :cnext<CR>
nmap [[ :cprev<CR>

""""""""""""""""""""""""""""""""""""""""
" THEME
""""""""""""""""""""""""""""""""""""""""
set termguicolors
colorscheme MainTheme

"Cursor settings:
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI.="\e[5 q" " INSERT mode
let &t_SR.="\e[5 q" " REPLACE mode
let &t_EI.="\e[1 q" " NORMAL mode

" Status Line
set laststatus=2

set modeline
set modelines=10

set statusline=%f%m%r%h%w%=(%{&ff}/%y)\ (line\ %l\/%l,\ col\ %c)\

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

command! FixWhitespace :%s/\s\+$//e


""""""""""""""""""""""""""""""""""""""""
" functions. TODO: Move em.
""""""""""""""""""""""""""""""""""""""""
function! s:CustomizeYcmQuickFixWindow()
  " Move the window to the left of the screen.
  wincmd L
  " Set the window width.
  100wincmd |
endfunction

autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()


""""""""""""""""""""""""""""""""""""""""
" Templates
""""""""""""""""""""""""""""""""""""""""
augroup templates
  au!
  " read in template files
  autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'.expand("<afile>:e")
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END

""""""""""""""""""""""""""""""""""""""""
" C# Setup & Bindings...
""""""""""""""""""""""""""""""""""""""""
let g:OmniSharp_server_use_net6=1

autocmd FileType cs nmap <C-B> :OmniSharpGotoDefinition<CR>
autocmd FileType cs nmap ga :OmniSharpGetCodeActions<CR>
autocmd FileType cs nmap rn :OmniSharpRename<CR>
autocmd FileType cs nmap fu :OmniSharpFixUsings<CR>
autocmd FileType cs imap <C-]> <ESC>:OmniSharpSignatureHelp<CR>a

let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:Normal,FloatBorder:Special',
\ 'border': 'rounded'
\}

nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

"""""""""""""""""""""""""""""""""""""""".
" Go Setup & Bindings...
""""""""""""""""""""""""""""""""""""""""
autocmd FileType go nmap rn :GoRename<CR>
autocmd FileType go nmap <C-B> :GoDef<CR>

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_auto_type_info = 1

:call extend(g:ale_linters, {
    \"go": ['golint', 'go vet'], })

""""""""""""""""""""""""""""""""""""""""
" Html Bindings...
""""""""""""""""""""""""""""""""""""""""
autocmd filetype html nmap ;! i<!doctype html><cr>
autocmd FileType html nmap ;html i<html></html><ESC>F<i
autocmd FileType html nmap ;tit i<title></title><ESC>F<i
autocmd FileType html nmap ;head i<head></head><ESC>F<i
autocmd FileType html nmap ;body i<body></body><ESC>F<i
autocmd FileType html nmap ;p i<p></p><ESC>F<i
autocmd FileType html nmap ;1 i<h1></h1><ESC>F<i
autocmd FileType html nmap ;2 i<h2></h2><ESC>F<i
autocmd FileType html nmap ;3 i<h3></h3><ESC>F<i
autocmd FileType html nmap ;4 i<h4></h4><ESC>F<i
autocmd FileType html nmap ;5 i<h5></h5><ESC>F<i
autocmd FileType html nmap ;6 i<h6></h6><ESC>F<i

lua require('init')
