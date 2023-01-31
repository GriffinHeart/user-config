local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup({
	server_filetype_map = {}
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap.set('n', '<leader>cf', '<cmd>Lspsaga lsp_finder<cr>')
keymap.set('n', '<leader>cd', '<cmd>Lspsaga peek_definition<cr>')
keymap.set('n', '<leader>cp', '<cmd>Lspsaga show_line_dianostics<cr>')
-- find a different binding
-- vim.keymap.set('n', '<C-i>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
