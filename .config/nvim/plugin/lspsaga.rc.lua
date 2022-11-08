local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
	server_filetype_map = {}
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', '<C-i>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
