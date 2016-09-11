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

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/tComment'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rbenv'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" javascript development
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lukaszkorecki/CoffeeTags'
Plugin 'walm/jshint.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mtscout6/syntastic-local-eslint.vim'

Plugin 'elzr/vim-json'

Plugin 'tpope/vim-speeddating'

Plugin 'rizzatti/dash.vim'

call vundle#end()

" highlight 80 column
let &colorcolumn=join(range(81,999),",")


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

let g:solarized_termtrans = 1
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
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1

"close scratch area on autocomplete
autocmd CompleteDone * pclose

"improve autocomplete menu color
"highlight Pmenu ctermbg=Black ctermfg=White gui=bold
"highlight PmenuSel ctermbg=White ctermfg=Black

set backspace=2
set backspace=indent,eol,start
set hlsearch
set incsearch
set scrolloff=2
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-0.(l=%l,c=%c%V,tl=%L%)\%h%m%r%=%-20(,bv=0x%B,%n%Y%)%{fugitive#statusline()}
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jade setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType stylus setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.js.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.js.handlebars set filetype=mustache
autocmd BufRead,BufNewFile *.md set filetype=markdown

" es6 like javascript
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

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

"
nmap <leader>gf <C-W>vgf 

" vim-rails
nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>

" command-T make matched show near the prompt
let g:CommandTMatchWindowReverse = 1
let g:CommandTMaxHeight = 15
set wildignore+=node_modules,public/js/vendor,php/lib/vendor,coverage,doc

" map CommandTFlush to F5
noremap <F5> :CommandTFlush<CR>

" let me hide non-saved buffers (vim will still warn)
set hidden

" quit nerdtree if last
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open nerdtree
let NERDTreeQuitOnOpen=1
nmap <leader>f :NERDTreeToggle<CR>
" Find current file in nerdtree
nmap <leader>c :NERDTreeFind<CR>

" remap split commands to be consistent with command-t
let NERDTreeMapOpenInTab='<C-T>'

" auto close nerdtree if its last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"set tags=./.tags
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:easytags_dynamic_files = 1

"tagbar options
nmap <leader>q :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_ctags_bin='/opt/boxen/homebrew/bin/ctags'
let g:tagbar_zoomwidth=0
let g:tagbar_autoclose=1
let g:tagbar_compact=1
let g:tagbar_show_visibility=0

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers= ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_args = '-R -D -C true'
let g:syntastic_aggregate_errors = 1
let g:syntastic_ruby_mri_quiet_messages = {
\ "regex": 'assigned but unused variable'
\ }

let g:syntastic_java_checkers= ['javac']
let g:syntastic_java_javac_config_file_enabled = 1

" vim-spec config
" run rspec with drb
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
let g:mocha_js_command = 'call Send_to_Tmux("mocha --require test/setup.js --compilers js:babel-register --recursive {spec}\n")'
let g:mocha_coffee_command = 'call Send_to_Tmux("mocha -C -b --compilers coffee:coffee-script {spec}\n")'
"mappings
map <leader>rs :call RunCurrentSpecFile()<CR>
map <leader>rn :call RunNearestSpec()<CR>
map <leader>rl :call RunLastSpec()<CR>
map <leader>ra :call RunAllSpecs()<CR>

" enable folding for coffee files
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" auto delete fugitive buffers on exit
autocmd BufReadPost fugitive://* set bufhidden=delete

" Fugitive use U to reset file
au FileType gitcommit nmap <buffer> U :Git checkout -- <c-r><c-g><cr>

nmap <leader>gst :Gst<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>

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
func! RefreshBrowser()
	exec "silent ! osascript -e 'tell application \"Google Chrome\" to reload active tab of window 2'"
	redraw!
endfunc
		
nmap <leader>rc :call RefreshBrowser()<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"let g:used_javascript_libs = 'underscore, angularjs, jasmine, jquery'
"let g:syntastic_javascript_checkers = ['jshint']

let g:syntastic_javascript_checkers = ['eslint']

" vim-jsx
let g:jsx_ext_required = 0

" easy tags
"let g:easytags_languages = {
"\   'Javascript': {
"\     'cmd': 'jsctags',
"\       'args': [],
"\       'fileoutput_opt': '-f',
"\       'stdout_opt': '-f-',
"\       'recurse_flag': '-R'
"\   }
"\}

" dash.vim
nmap <silent> <leader>d <Plug>DashSearch

nmap <leader>w :w<CR>
