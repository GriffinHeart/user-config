local status, navi = pcall(require, 'nvim-tmux-navigation')
if (not status) then return end

navi.setup {}

vim.keymap.set('n', '<C-h>', navi.NvimTmuxNavigateLeft)
vim.keymap.set('n', '<C-j>', navi.NvimTmuxNavigateDown)
vim.keymap.set('n', '<C-k>', navi.NvimTmuxNavigateUp)
vim.keymap.set('n', '<C-l>', navi.NvimTmuxNavigateRight)
