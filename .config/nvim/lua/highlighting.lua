vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

-- Invisible character colors
vim.cmd([[highlight NonText guifg=#4a4a59]])
vim.cmd([[highlight SpecialKey guifg=#4a4a59]])
-- More highlighting for trailling white space
vim.cmd([[highlight TrailingWhitespace ctermbg=darkgray guibg=darkgray]])
vim.cmd([[match TrailingWhitespace /\s\+$\| \+\ze\t/]])

-- Highlight past column > 80
vim.cmd([[highlight ColorColumn ctermbg=darkgray guibg=darkgrey]])
vim.cmd([[let &colorcolumn=join(range(81, 999), ',')]])
