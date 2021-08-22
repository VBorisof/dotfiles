source $VIMRUNTIME/defaults.vim

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
set relativenumber
set numberwidth=4

set clipboard=unnamedplus

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

"let f:OmniSharp_highlighting = 2

set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow
set splitright

":Minimap

""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'OmniSharp/omnisharp-vim'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'chrisbra/Colorizer'
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'severin-lemaignan/vim-minimap'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()


""""""""""""""""""""""""""""""""""""""""
" KEYMAPS
""""""""""""""""""""""""""""""""""""""""
map <O> O<Esc>

nnoremap ; :

nnoremap <C-l> :vertical resize +5<CR> 
nnoremap <C-h> :vertical resize -5<CR> 
nnoremap <C-k> :res +5<CR>
nnoremap <C-j> :res -5<CR>

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

inoremap ( ()<left>
inoremap [ []<left>
"inoremap { {<CR><CR>}<C-O>k<Tab>

nmap <C-B> :YcmCompleter GoToDefinition<CR>
nmap <C-T> <Plug>(YCMFindSymbolInWorkspace)
nmap <F2> :NERDTree<CR>
nmap <F12> :YcmCompleter GoToReferences<CR>

""""""""""""""""""""""""""""""""""""""""
" THEME
""""""""""""""""""""""""""""""""""""""""
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

filetype plugin on


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
" C# Bindings...
""""""""""""""""""""""""""""""""""""""""
autocmd FileType cs nmap <C-B> :OmniSharpGotoDefinition<CR>
autocmd FileType cs nmap ga :OmniSharpGetCodeActions<CR>
autocmd FileType cs nmap rn :OmniSharpRename<CR>
autocmd FileType cs nmap fu :OmniSharpFixUsings<CR>

