"this is using the vim-gotham style of setting most colors

hi clear
if exists('syntax on') | syntax reset | endif
set background=dark
let g:colors_name = 'MainTheme'

" Execute the 'highlight' command with a List of arguments.
function! s:Highlight(args)
  exec 'highlight ' . join(a:args, ' ')
endfunction

function! s:AddGroundValues(accumulator, ground, color)
  let new_list = a:accumulator
  for [where, value] in items(a:color)
    if value == "NONE" || value == "none" || value == ""
      call add(new_list, where . a:ground . '= NONE')
    else
      call add(new_list, where . a:ground . '=' . value)
    endif
  endfor

  return new_list
endfunction

function! s:Col(group, fg_name, ...)
  " ... = optional bg_name

  let pieces = [a:group]

  if a:fg_name !=# ''
    let pieces = s:AddGroundValues(pieces, 'fg', s:colors[a:fg_name])
  endif

  if a:0 > 0 && a:1 !=# ''
    let pieces = s:AddGroundValues(pieces, 'bg', s:colors[a:1])
  endif

  call s:Clear(a:group)
  call s:Highlight(pieces)
endfunction

function! s:Attr(group, attr)
  let l:attrs = [a:group, 'term=' . a:attr, 'cterm=' . a:attr, 'gui=' . a:attr]
  call s:Highlight(l:attrs)
endfunction

function! s:Clear(group)
  exec 'highlight clear ' . a:group
endfunction


" Colors ======================================================================

" Let's store all the colors in a dictionary.
let s:colors = {}

" Base colors
let s:colors.base0  = { 'gui': '#ffffff', 'cterm':  15 }
let s:colors.base1  = { 'gui': '#492224', 'cterm':  52 }
let s:colors.base2  = { 'gui': '#a1a6a8', 'cterm': 248 }
let s:colors.base3  = { 'gui': '#192224', 'cterm': 235 }
let s:colors.base4  = { 'gui': '#bd9800', 'cterm': 249 }
let s:colors.base5  = { 'gui': '#536991', 'cterm':  60 }
let s:colors.base6  = { 'gui': '#b5b5b5', 'cterm': 249 }
let s:colors.base7  = { 'gui': '#965b3f', 'cterm': 137 }
let s:colors.base8  = { 'gui': '#4b4b4b', 'cterm': 239 }
let s:colors.base10 = { 'gui': '#536c70', 'cterm':  66 }
let s:colors.base11 = { 'gui': '#cfcfcf', 'cterm': 252 }
let s:colors.base12 = { 'gui': '#a33202', 'cterm': 130 }
let s:colors.base13 = { 'gui': '#ff0d0d', 'cterm': 196 }
let s:colors.base14 = { 'gui': '#f9f9ff', 'cterm': 189 }
let s:colors.base15 = { 'gui': 'NONE'   , 'cterm': 254 }
let s:colors.base16 = { 'gui': '#6b6b6b', 'cterm': 242 }
let s:colors.base17 = { 'gui': '#a3b4ba', 'cterm': 109 }
let s:colors.base18 = { 'gui': '#c4c7c8', 'cterm': 251 }
let s:colors.base19 = { 'gui': '#835cad', 'cterm':  97 }
let s:colors.base20 = { 'gui': '#828282', 'cterm':   8 }
let s:colors.base21 = { 'gui': '#d9d5d5', 'cterm': 253 }
let s:colors.base22 = { 'gui': '#969693', 'cterm': 246 }
let s:colors.base23 = { 'gui': '#000000', 'cterm':  16 }
let s:colors.base24 = { 'gui': '#3a3c3e', 'cterm': 237 }

" Other colors.
let s:colors.white   = { 'gui': '#ffffff', 'cterm': 231 }
let s:colors.red     = { 'gui': '#c23127', 'cterm': 124 }
let s:colors.orange  = { 'gui': '#ff9599', 'cterm': 208 }
let s:colors.yellow  = { 'gui': '#edb443', 'cterm': 214 }
let s:colors.magenta = { 'gui': '#888ca6', 'cterm': 67  }
let s:colors.violet  = { 'gui': '#4e5166', 'cterm': 60  }
let s:colors.blue    = { 'gui': '#195466', 'cterm': 24  }
let s:colors.cyan    = { 'gui': '#33859E', 'cterm': 44  }
let s:colors.green   = { 'gui': '#2aa889', 'cterm': 78  }
let s:colors.acid_green = { 'gui': '#00ff00', 'cterm': 10  }
let s:colors.dark_blue  = { 'gui': 'NONE', 'cterm': 17  }
let s:colors.light_gray = { 'gui': 'NONE', 'cterm': 250  }
let s:colors.dark_gray = { 'gui': '#888888', 'cterm': 102  }
let s:colors.light_blue = { 'gui': '#5552ff', 'cterm': 63 }
let s:colors.almost_white = { 'gui': '#dae3ed', 'cterm': 254 }

let s:colors.none    = { 'gui': 'NONE', 'cterm': 'NONE'  }

" Normal modes
call s:Col('Normal', 'base0', 'base23')

" Line, cursor and so on.
call s:Col('Cursor', 'base15', 'none')
call s:Col('CursorLine', 'none', 'base24')
call s:Col('CursorColumn', 'base0', 'base23')
call s:Col('cursorim', 'base3', 'base1')

" Sign column, line numbers.
call s:Col('LineNr', 'base8')
call s:Col('SignColumn', 'base3', 'base3')
call s:Col('ColorColumn', 'base0', 'base24')
let s:colors.light_blue = { 'gui': '#5552ff', 'cterm': 63 }
let s:colors.almost_white = { 'gui': '#dae3ed', 'cterm': 254 }

let s:colors.none    = { 'gui': 'NONE', 'cterm': 'NONE'  }

" Normal modes
call s:Col('Normal', 'base0', 'base23')

" Line, cursor and so on.
"call s:Col('Cursor', 'base15')
"call s:Col('CursorLine', 'none', 'base24')
"call s:Col('CursorColumn', 'base0')
"call s:Col('cursorim', 'base3')

" Sign column, line numbers.
call s:Col('LineNr', 'base8')
call s:Col('SignColumn', 'base3', 'base3')
call s:Col('ColorColumn', 'base0', 'base24')

" Visual selection.
call s:Col('Visual', 'base0', 'dark_blue')

" Easy-to-guess code elements.
call s:Col('Comment', 'acid_green')
call s:Col('String', 'orange')
call s:Col('Number', 'light_gray')
call s:Col('Statement', 'light_blue')
call s:Attr('Statement', 'bold')
call s:Col('Special', 'orange')
call s:Col('Identifier', 'almost_white')

" Constants, Ruby symbols.
call s:Col('Constant', 'almost_white')

" Some HTML tags (<title>, some <h*>s)
call s:Col('Title', 'base6', 'base1')
call s:Attr('Title', 'bold')

" <a> tags.
call s:Col('Underlined', 'base14', 'base3')
call s:Attr('Underlined', 'underline')

" Types, HTML attributes, Ruby constants (and class names).
call s:Col('Type', 'light_blue')
call s:Attr('Type', 'bold')

" Stuff like 'require' in Ruby.
call s:Col('PreProc', 'dark_gray')

" Tildes on the bottom of the page.
call s:Col('NonText', 'base10')

" TODO and similar tags.
call s:Col('Todo', 'base13')

" The column separating vertical splits.
call s:Col('VertSplit', 'base3')
call s:Col('StatusLineNC', 'base0', 'base8')
call s:Attr('StatusLineNC', 'bold')

" Matching parenthesis.
call s:Col('MatchParen', 'acid_green')
call s:Attr('MatchParen', 'bold')

" Special keys, e.g. some of the chars in 'listchars'. See ':h listchars'.
call s:Col('SpecialKey', 'base10')
call s:Attr('SpecialKey', 'bold')

" Folds.
call s:Col('Folded', 'base3', 'base2')
call s:Attr('Folded', 'bold')
call s:Col('FoldColumn', 'base3', 'base2')
call s:Attr('FoldColumn', 'bold')

" Searching.
call s:Col('Search', 'base0', 'base1')
call s:Col('IncSearch', 'base0', 'base1')

" Popup menu.
call s:Col('Pmenu', 'base0', 'base3')
call s:Col('PmenuSel', 'base0', 'base1')
call s:Col('PmenuSbar', 'base0', 'base20')
call s:Col('PmenuThumb', 'base15', 'base2')

" Command line stuff.
call s:Col('ErrorMsg', 'base11', 'base12')
call s:Col('ModeMsg', 'base21', 'base3')
call s:Attr('ModeMsg', 'bold')

" Wild menu.
" StatusLine determines the color of the non-active entries in the wild menu.
call s:Col('StatusLine', 'base0', 'base1')
call s:Attr('StatusLine', 'bold')
call s:Col('WildMenu', 'base0', 'base2')

" The 'Hit ENTER to continue prompt'.
"call s:Col('Question', )

" Tab line.
call s:Col('TabLineSel', 'base0', 'base1')  " the selected tab
call s:Attr('TabLineSel', 'bold')
call s:Col('TabLine', 'base3', 'base22')     " the non-selected tabs
call s:Attr('TabLine', 'bold')
call s:Col('TabLineFill', 'base3', 'base8') " the rest of the tab line
call s:Attr('TabLineFill', 'bold')

" Spelling.
call s:Col('SpellBad', 'base14', 'base3')
call s:Attr('SpellBad', 'underline')
call s:Col('SpellCap', 'base14', 'base3')
call s:Attr('SpellCap', 'underline')
call s:Col('SpellLocal', 'base14', 'base3')
call s:Attr('SpellLocal', 'underline')
call s:Col('SpellRare', 'base14', 'base3')
call s:Attr('SpellRare', 'underline')

" Diffing.
call s:Col('DiffAdd', 'base0', 'base23')
call s:Col('DiffChange', 'base0', 'base1')
call s:Col('DiffDelete', 'base0', 'base3')
call s:Col('DiffText', 'base0', 'base1')

" Directories (e.g. netrw).
call s:Col('Directory', 'base5')
call s:Attr('Directory', 'bold')

" Plugin =======================================================================

" GitGutter
call s:Col('GitGutterAdd', 'green', 'base3')
call s:Col('GitGutterChange', 'yellow', 'base3')
call s:Col('GitGutterDelete', 'red', 'base3')
call s:Col('GitGutterChangeDelete', 'orange', 'base3')

" vim-better-whitespace
call s:Col('ExtraWhitespace', 'violet', 'yellow')

" Cleanup =====================================================================

unlet s:colors

" End of gotham-esque settings

set colorcolumn=81
highlight ColorColumn ctermbg=17

set cursorline
highlight CursorLine cterm=none ctermbg=17 

