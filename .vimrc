set enc=utf-8
set clipboard=unnamed
scriptencoding utf-8

set nocompatible
filetype off
let mapleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-x>"

" set file encodings
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8                     " better default than latin1
	setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

let g:agprg = 'ag --nogroup --nocolor --column'
let g:aghighlight = 1

set background=dark
colorscheme solarized
set number
syntax on
filetype plugin indent on
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"improve autocomplete menu color
"highlight Pmenu ctermbg=Black ctermfg=White gui=bold
"highlight PmenuSel ctermbg=White ctermfg=Black

set backspace=2
set backspace=indent,eol,start
set hlsearch
set incsearch
set scrolloff=2
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,bytval=0x%B,%n%Y%)\%P
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jade setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType stylus setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab


" Shortcut to rapidly toggle `set list`
nmap <leader>ll :set list!<CR>

" close location list
nmap <leader>lc :lclose<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,eol:¬,trail:·

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

"tagbar options
nmap <leader>q :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_ctags_bin='/opt/boxen/homebrew/bin/ctags'
let g:tagbar_zoomwidth=0
let g:tagbar_autoclose=1
let g:tagbar_compact=1
let g:tagbar_show_visibility=0

" Syntastic config
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_auto_loc_list=1
let g:syntastic_ruby_checkers= ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_args = '-R'

" vim-rspec config
" run rspec with drb
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let g:mocha_js_command = 'call Send_to_Tmux("mocha --recursive --nocolors {spec}\n")'
let g:mocha_coffee_command = 'call Send_to_Tmux("mocha -C -b --compilers coffee:coffee-script {spec}\n")'
"mappings
map <leader>rs :call RunCurrentSpecFile()<CR>
map <leader>rn :call RunNearestSpec()<CR>
map <leader>rl :call RunLastSpec()<CR>
map <leader>ra :call RunAllSpecs()<CR>

" enable folding for coffee files
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" for coffee tags
if executable('coffeetags')
	let g:tagbar_type_coffee = {
				\ 'ctagsbin' : 'coffeetags',
				\ 'ctagsargs' : '--include-vars',
				\ 'kinds' : [
				\ 'f:functions',
				\ 'o:object',
				\ ],
				\ 'sro' : ".",
				\ 'kind2scope' : {
				\ 'f' : 'object',
				\ 'o' : 'object',
				\ }
				\ }
endif

" easy motion config
nmap <Leader>s <Plug>(easymotion-s)
" used wit dt, ct, etc...
omap <Leader>t <Plug>(easymotion-bd-tl)
" line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" function to refresh chrome browser in mac
function! RefreshBrowser()
	execute "! osascript -e \"tell application \"Google Chrome\" \"chrome\" set winref to a reference to (first window whose title does not start with \"Developer Tools - \") set winref's index to 1 reload active tab of winref end tell\""
endfunction
		
nmap <leader>c :call RefreshBrowser()<CR>
