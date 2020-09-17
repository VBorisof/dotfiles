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

""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'OmniSharp/omnisharp-vim'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""
" KEYMAPS
""""""""""""""""""""""""""""""""""""""""
map <Enter> o<Esc>
map <O> O<Esc>

nnoremap ; :

""""""""""""""""""""""""""""""""""""""""
" THEME
""""""""""""""""""""""""""""""""""""""""
set colorcolumn=81
highlight ColorColumn ctermbg=17

set cursorline
highlight CursorLine cterm=none ctermbg=17 

