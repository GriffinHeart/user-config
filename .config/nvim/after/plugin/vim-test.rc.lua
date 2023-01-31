vim.cmd [[
  let test#strategy = "tslime"
  let test#python#runner = "pytest"
]]

-- Running tests
local keymap = vim.keymap
local opts = { silent = true }

keymap.set('n', '<leader>ra', ':TestSuite<CR>', opts)
keymap.set('n', '<leader>rf', ':TestFile<CR>', opts)
keymap.set('n', '<leader>rl', ':TestLast<CR>', opts)
keymap.set('n', '<leader>rn', ':TestNearest<CR>', opts)
