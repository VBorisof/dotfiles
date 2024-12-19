" Custom filetypes
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.note		setfiletype note
  au! BufRead,BufNewFile *.bs		setfiletype bs
  au! BufRead,BufNewFile *.fx		setfiletype hlsl
augroup END
