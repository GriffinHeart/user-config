vim.cmd('autocmd!')

-- disable mouse
vim.opt.mouse = ''

vim.opt.clipboard = 'unnamedplus'
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin= 1

-- when no suitable python3 found it makes vim startup very slow, disable it
-- this disables ability to for example can't run :python3 print("testing")
vim.g.loaded_python3_provider = 0

vim.opt.title = true
vim.opt.backup = false
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 2
vim.opt.laststatus = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.hidden = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Search down subfolders to find files
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wildmode = 'longest:full,list:full'

vim.opt.listchars = 'tab:>\\ ,eol:¬,trail:·'

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
--vim.opt.background = 'dark'

vim.opt.signcolumn = 'yes'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.splitbelow = true
vim.opt.splitright = true

-- make - part of a word
vim.opt.iskeyword:append('-')

-- let columns after 80 be highlighted
vim.cmd([[let &colorcolumn=join(range(81, 999), ',')]])
