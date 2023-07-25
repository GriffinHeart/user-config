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

-- clear searched highlight
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- maximize toggle
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')


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

-- Preserve copy when pasting
keymap.set('x', '<leader>p', '"_dP')

-- make <leader>gf open file
keymap.set('n', '<leader>gf', '<C-W>vgf')

-- open alternate files in v and h splits
keymap.set('n', '<leader>av', ':AV<CR>', noremap_opt)
keymap.set('n', '<leader>as', ':AS<CR>', noremap_opt)

-- Move lines visually
-- TODO: find better mapping
-- keymap.set('v', 'J', ":m '>+1<CR>gv=gv'")
-- keymap.set('v', 'K', ":m '<-2<CR>gv=gv'")

-- Join while keeping cursor in same place
keymap.set('n', 'J', 'mzJ`z')

-- Center screen when scrolling search results
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- Center screen when moving half pages
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', '<C-d>', '<C-d>zz')

-- Toggle setlist
keymap.set('n', '<leader>ll', ':set list!<CR>')

-- start replace on word
keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- code related bindings
-- LSP incoming calls looks usefull check it in lspsaga

local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>_=', '<cmd>lua vim.lsp.buf.format()<cr>')

keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)

-- leader xh is bound in rust tools
-- lightbulb code action
keymap.set('n', '<leader>xa', '<cmd>Lspsaga code_action<cr>', opts)
keymap.set('n', '<leader>xl', '<cmd>Lspsaga outline<cr>', opts)
-- diagnostics
keymap.set('n', '<leader>xs', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
keymap.set('n', '<leader>xt', '<cmd>TroubleToggle<cr>', opts)

keymap.set('n', '<leader>xf', '<cmd>Lspsaga finder<cr>', opts)
keymap.set('n', '<leader>xi', '<cmd>Lspsaga incoming_calls<cr>', opts)
-- if not needed change outline to be this one
--keymap.set('n', '<leader>xo', '<cmd>Lspsaga outgoing_calls<cr>', opts)

keymap.set('n', '<leader>xd', '<cmd>Lspsaga peek_definition<cr>', opts)
