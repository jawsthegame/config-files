syntax enable
set background=dark
set nocompatible
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set showmatch
set ruler
set number
set virtualedit=all
set laststatus=2
set encoding=utf-8

filetype plugin on
call pathogen#infect()

" This function will update snippets list for current and empty filetype:
function! SnippetsUpdate(snip_dir)
  call ResetSnippets()
  call GetSnippets(a:snip_dir, '_')
  call GetSnippets(a:snip_dir, &ft)
endfunction

" This command will cause SnippetsUpdate() with parameter
command SnipUpdate :call SnippetsUpdate("~/.vim/snippets")

" Optionaly, create any suitable key binding, for example <Leader>su
map <Leader>su :SnipUpdate<CR>

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Tabs
map ,, :tabnew<CR><CR>
map ,. :tabnext<CR><CR>
map ., :tabprev<CR><CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" NERDTree
map @@ :NERDTreeToggle<CR><CR>
map @# :NERDTreeFocus<CR>

" HH
nmap HH :silent ! mpg321 /home/tom/.vim/succ_horns.mp3<CR>

let g:tagbar_type_coffee = {
  \ 'ctagstype' : 'coffee',
  \ 'kinds' : [
  \   'c:classes',
  \   'f:functions',
  \   'v:variables'
  \ ],
  \ }

let g:Powerline_symbols='fancy'

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
  au! BufRead,BufNewFile *.hx setfiletype haxe
augroup end

:au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\>80v', -1)
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
