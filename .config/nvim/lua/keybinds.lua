-- Make , leader
vim.g.mapleader = ','

local keymap = vim.keymap
local noremap_opt = { noremap = true }

-- move to next displayed line (helps with wrap)
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')

-- jk to esc
keymap.set('i', 'jk', '<esc>', noremap_opt)
-- unbind esc
keymap.set('i', '<esc>', '<nop>', noremap_opt)


-- Turn off arrow keys
keymap.set('n', '<Left>', '<nop>', noremap_opt)
keymap.set('n', '<Right>', '<nop>', noremap_opt)
keymap.set('n', '<Up>', '<nop>', noremap_opt)
keymap.set('n', '<Down>', '<nop>', noremap_opt)
keymap.set('i', '<Left>', '<nop>', noremap_opt)
keymap.set('i', '<Right>', '<nop>', noremap_opt)
keymap.set('i', '<Up>', '<nop>', noremap_opt)
keymap.set('i', '<Down>', '<nop>', noremap_opt)


-- navigation mappings
keymap.set('n', '<C-H>', '<C-W><C-H>', noremap_opt)
keymap.set('n', '<C-J>', '<C-W><C-J>', noremap_opt)
keymap.set('n', '<C-K>', '<C-W><C-K>', noremap_opt)
keymap.set('n', '<C-L>', '<C-W><C-L>', noremap_opt)


-- ,w to write
keymap.set('n', '<leader>w', ':w<CR>')

-- Don't yank when deleting chars
keymap.set('n', 'x', '"_x')

-- make <leader>gf open file
keymap.set('n', '<leader>gf', '<C-W>vgf')

-- open alternate files in v and h splits
keymap.set('n', '<leader>av', ':AV<CR>', noremap_opt)
keymap.set('n', '<leader>as', ':AS<CR>', noremap_opt)


-- Center screen when scrolling search results
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')

-- Toggle setlist
keymap.set('n', '<leader>ll', ':set list!<CR>')
