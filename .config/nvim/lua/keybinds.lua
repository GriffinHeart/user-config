-- Make , leader
vim.g.mapleader = ','

local keymap = vim.keymap
local noremap_opt = { noremap = true }

-- move to next displayed line (helps with wrap)
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')

-- jk to esc
keymap.set('i', 'jk', '<esc>', noremap_opt)

-- bind esc to clear hlsearch
keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr>', { desc = 'Escape and clear hlsearch', noremap = true })

-- maximize toggle
keymap.set('n', '<leader>um', ':MaximizerToggle<CR>')

local function diag_toggle()
  -- if this Neovim version supports checking if diagnostics are enabled
  -- then use that for the current state
  local enabled
  if vim.diagnostic.is_disabled then
    enabled = not vim.diagnostic.is_disabled()
  end
  enabled = not enabled

  local rustools = require('rust-tools')
  if enabled then
    vim.diagnostic.enable()
    if rustools then rustools.inlay_hints.set() end
  else
    vim.diagnostic.disable()
    if rustools then rustools.inlay_hints.unset() end
  end
end

-- toggle diagnostics
keymap.set('n', '<leader>lsp', function() diag_toggle() end, { desc = "Toggle diagnostics" })

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

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- ,w to write
keymap.set('n', '<leader>w', ':w<CR>')

-- Don't yank when deleting chars
keymap.set('n', 'x', '"_x')

-- Preserve copy when pasting
keymap.set('x', '<leader>p', '"_dP')

-- make <leader>gf open file in vsplit
keymap.set('n', '<leader>gf', '<C-W>vgf')
-- make gd jump to definition from lsp (gd usually only jumps file locally)
keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, noremap_opt)
-- make ,] go to definition in a vsplit
keymap.set('n', '<leader>]', ':vsplit | lua vim.lsp.buf.definition()<CR>')

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

-- go back to visual after indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Toggle setlist (show whitespace characters)
keymap.set('n', '<leader>ll', ':set list!<CR>')
keymap.set('n', '<leader>sw', ':StripWhitespace<CR>')

-- start replace on word
keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- code related bindings
-- LSP incoming calls looks usefull check it in lspsaga

local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>_=', '<cmd>lua vim.lsp.buf.format()<cr>')

keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)

-- leader xh is bound in rust tools
-- lightbulb code action
keymap.set('n', '<leader>da', '<cmd>Lspsaga code_action<cr>', opts)
keymap.set('n', '<leader>dl', '<cmd>Lspsaga outline<cr>', opts)


-- diagnostics
keymap.set('n', '<leader>ds', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
keymap.set('n', '<leader>dt', '<cmd>TroubleToggle<cr>', opts)

keymap.set('n', '<leader>df', '<cmd>Lspsaga finder<cr>', opts)
keymap.set('n', '<leader>di', '<cmd>Lspsaga incoming_calls<cr>', opts)
-- if not needed change outline to be this one
--keymap.set('n', '<leader>xo', '<cmd>Lspsaga outgoing_calls<cr>', opts)

keymap.set('n', '<leader>dd', '<cmd>Lspsaga peek_definition<cr>', opts)
keymap.set('n', '<leader>dr', '<cmd>lua lua.lsp.buf.rename()<cr>', opts)

-- git related
keymap.set('n', '<leader>gb', '<cmd>Git blame -w -C -C -C<cr>')
