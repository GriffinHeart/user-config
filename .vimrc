set nocompatible              " be iMproved, required
set rubydll=~/.rbenv/versions/2.6.3/lib/libruby.dylib
" mac clipboard integration
set clipboard=unnamed
set enc=utf-8
scriptencoding utf-8

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" theme
Plugin 'altercation/vim-colors-solarized'

" autocomplete
Plugin 'Valloric/YouCompleteMe'

" search
Plugin 'mileszs/ack.vim' "install ag

" File navigation
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Go from vim to tmux with keybind
Plugin 'christoomey/vim-tmux-navigator'

" send commands to tmux
Plugin 'jgdavey/tslime.vim'

" Tagbars
Plugin 'majutsushi/tagbar'

" repeat all the things
Plugin 'tpope/vim-repeat'

" refresh browser
Plugin 'mkitt/browser-refresh.vim'

" git integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" fuzzy file finder
Plugin 'wincent/command-t'

" toogle location list
Plugin 'Valloric/ListToggle'

" show indentation marks
Plugin 'nathanaelkane/vim-indent-guides'

" comment all the things
Plugin 'tomtom/tcomment_vim'

" match everything with %
Plugin 'tmhedberg/matchit'

" maker
Plugin 'neomake/neomake'

" syntax checker & linter
"Plugin 'scrooloose/syntastic'
"Plugin 'mtscout6/syntastic-local-eslint.vim'

" surround all the things
Plugin 'tpope/vim-surround'

" split and join gS gJ
Plugin 'AndrewRadev/splitjoin.vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'

Plugin 'thoughtbot/vim-rspec'

" Rails
Plugin 'tpope/vim-rails'

" javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'

" go
Plugin 'fatih/vim-go'

" json
Plugin 'elzr/vim-json'

" terraform
Plugin 'hashivim/vim-terraform'

" increment decrement dates C-A
Plugin 'tpope/vim-speeddating'

" Mappings for common stuff
Plugin 'tpope/vim-unimpaired'

" Dash bindings
Plugin 'rizzatti/dash.vim'

call vundle#end()

filetype plugin indent on
syntax on
set number
set background=dark
colorscheme solarized

let mapleader = ","

" highlight 80 column
let &colorcolumn=join(range(81,999),",")

set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set scrolloff=2
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-0.(l=%l,c=%c%V,tl=%L%)\%h%m%r%=%-20(,bv=0x%B,%n%Y%)%{fugitive#statusline()}
" let me hide non-saved buffers (vim will still warn)
set hidden

" file type configs
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jade setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType stylus setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.js.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.js.handlebars set filetype=mustache
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Ruby file configs
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" generate tags that ycm can use
let g:rails_ctags_arguments = ['--fields=+l']

" open new split panes to right and bottom
set splitbelow
set splitright

" set to move to next displayed line (helps with warp)
nnoremap j gj
nnoremap k gk

" make jk in insert be esc
inoremap jk <esc>
" force to use jk
inoremap <esc> <nop>

" Turn off arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" navigation mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" make <leader>gf open file in vertical split
nmap <leader>gf <C-W>vgf

" vim-rails
nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>

" function to keep last cursor
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

" remove trailing whitespace
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" indent everything
nmap _= :call Preserve("normal gg=G")<CR>

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Shortcut to rapidly toggle `set list`
" nmap <leader>ll :set list!<CR>

" easier file save
nmap <leader>w :w<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,eol:¬,trail:·

" location list toogle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>o'

" Neomake
let g:neomake_open_list = 0
" run neomake on write of a file
autocmd! BufWritePost * Neomake
let g:neomake_ruby_rubocop_maker = {
    \ 'args': ['--format', 'emacs', '-D', '-C', 'true'],
    \ }

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_ruby_checkers= ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_args = '-D -C true'
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}
let g:syntastic_javascript_checkers=['eslint']

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" vim-ruby config
let g:ruby_indent_block_style='do'

" ack
let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column'
let g:ackhighlight = 1

"tagbar options
nmap <leader>q :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_zoomwidth=0
let g:tagbar_autoclose=1
let g:tagbar_compact=1
let g:tagbar_show_visibility=0

" you complete me config
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_detailed_diagnostics = ''

" command-t
let g:CommandTMatchWindowReverse = 1
let g:CommandTMaxHeight = 15
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"
noremap <F5> :CommandTFlush<CR>


" nerdtree config
"
" open nerdtree
let NERDTreeQuitOnOpen=1
nmap <leader>f :NERDTreeToggle<CR>

" show current file
nmap <leader>c :NERDTreeFind<CR>

" remap split commands to be consistent with command-t
let NERDTreeMapOpenInTab='<C-T>'

" auto close nerdtree if its last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" tslime config
let g:tslime_always_current_session = 1

" vim-rspec config
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
let g:mocha_js_command = 'call Send_to_Tmux("mocha test/.setup.js {spec}\n")'
map <leader>rs :call RunCurrentSpecFile()<CR>
map <leader>rn :call RunNearestSpec()<CR>
map <leader>rl :call RunLastSpec()<CR>
map <leader>ra :call RunAllSpecs()<CR>

" auto delete fugitive buffers on exit
autocmd BufReadPost fugitive://* set bufhidden=delete

" Fugitive use U to reset file
au FileType gitcommit nmap <buffer> U :Git checkout -- <c-r><c-g><cr>

nmap <leader>gst :Gst<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>

highlight TrailingWhitespace ctermbg=darkgray guibg=darkgray
match TrailingWhitespace /\s\+$\| \+\ze\t/

" reload browser
nmap <silent><leader>rb :RRB<CR>

" vim-indent-guides
let g:indent_guides_start_level=3
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" vim-jsx
let g:jsx_ext_required = 0

" vim-dash
nmap <silent> <leader>d <Plug>DashSearch
