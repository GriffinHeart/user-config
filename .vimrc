runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set background=dark
set number
syntax on
filetype on
filetype plugin indent on
autocmd FileType ruby compiler ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
set backspace=2
set backspace=indent,eol,start
set hlsearch
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,bytval=0x%B,%n%Y%)\%P
runtime macros/matchit.vim
