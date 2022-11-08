local status, git_signs = pcall(require, 'gitsigns')
if (not status) then return end

git_signs.setup()
