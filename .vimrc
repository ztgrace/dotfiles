syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab
set ruler
set ignorecase
set hlsearch
set incsearch
set cursorline
set number
set autoread
set laststatus=2

" nerdcommenter
filetype plugin on
let mapleader = ","
set timeout timeoutlen=1500

set background=dark
colorscheme solarized
let g:solarized_termcolors=256

au BufNewFile,BufRead *.rc set syntax=ruby
au BufNewFile,BufRead *.nessus set syntax=off

" ruby
au BufNewFile,BufRead *.rb set tabstop=2
au BufNewFile,BufRead *.rb set shiftwidth=2
au BufNewFile,BufRead *.rb set softtabstop=2

" markdown
" http://www.reddit.com/r/vim/comments/2x5yav/markdown_with_fenced_code_blocks_is_great/
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" Vagrant
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead Vagrantfile set tabstop=2
au BufNewFile,BufRead Vagrantfile set shiftwidth=2
au BufNewFile,BufRead Vagrantfile set softtabstop=2

" yaml
au BufNewFile,BufRead *.yml set tabstop=2
au BufNewFile,BufRead *.yml set shiftwidth=2
au BufNewFile,BufRead *.yml set softtabstop=2

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
