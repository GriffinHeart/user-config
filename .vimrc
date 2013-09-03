scriptencoding utf-8
let mapleader = ","


runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set background=dark
colorscheme solarized
set number
syntax on
filetype on
filetype plugin indent on
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=Black ctermfg=White gui=bold
highlight PmenuSel ctermbg=White ctermfg=Black
set backspace=2
set backspace=indent,eol,start
set hlsearch
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,bytval=0x%B,%n%Y%)\%P
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
runtime macros/matchit.vim

function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Turn off arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ignore case in search
set ignorecase

" set to move to next displayed line (helps with warp)
nnoremap j gj
nnoremap k gk

" open new split panes to right and bottom
set splitbelow
set splitright

" navigation mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set file encodings
set fileencodings=ucs-bom,utf-8,default,latin1,sjis

" command-T make matched show near the prompt
let g:CommandTMatchWindowReverse = 1 

" map CommandTFlush to F5
noremap <F5> :CommandTFlush<CR>

" let me hide non-saved buffers (vim will still warn)
set hidden
" focus nerdtree on the current file
" returns true iff is NERDTree open/active
function! rc:isNTOpen()        
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true iff focused window is NERDTree window
function! rc:isNTFocused()     
	return -1 != match(expand('%'), 'NERD_Tree') 
endfunction 

" calls NERDTreeFind iff NERDTree is active, current window contains a
" modifiable file, and we're not in vimdiff
function! rc:syncTree()
	if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	endif
endfunction

"autocmd BufEnter * call rc:syncTree()

" open nerdtree
let NERDTreeQuitOnOpen=1
nmap <leader>f :NERDTreeToggle<CR>

" remap split commands to be consistent with command-t
let NERDTreeMapOpenInTab='<C-T>'

" auto close nerdtree if its last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

