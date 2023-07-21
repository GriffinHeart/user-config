local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup({
  definition = {
    keys = {
      edit = '<cr>',
      split = 's',
      vsplit = 'v',
    }
  },
  server_filetype_map = {},
  symbol_in_winbar = { enable = false },
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap.set('n', '<leader>cf', '<cmd>Lspsaga finder<cr>')
keymap.set('n', '<leader>cd', '<cmd>Lspsaga peek_definition<cr>')
-- find a different binding
-- vim.keymap.set('n', '<C-i>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
