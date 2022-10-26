vim.cmd('autocmd!')


vim.opt.clipboard = 'unnamedplus'
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true


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
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.hidden = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Search down subfolders to find files
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.listchars = 'tab:>\\ ,eol:¬,trail:·'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.splitbelow = true
vim.opt.splitright = true
