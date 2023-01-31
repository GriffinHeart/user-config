local status, matchup = pcall(require, 'match-up')
if (not status) then return end

matchup.setup({})

vim.g.matchup_matchparen_offscreen = { method = 'popup' }
vim.g.matchup_surround_enabled = 1

