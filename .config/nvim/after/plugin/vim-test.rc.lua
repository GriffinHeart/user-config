vim.cmd [[
  let test#strategy = "tslime"

  function! RustTransform(cmd) abort
    if 'cargo nextest run' =~ a:cmd
      return substitute(a:cmd, "lib::", "", "")
    endif
    return a:cmd
  endfunction

  let g:test#custom_transformations = { 'tslime': function('RustTransform')}
  let g:test#transformation = 'tslime'
]]

-- Running tests
local keymap = vim.keymap
local opts = { silent = true }

keymap.set('n', '<leader>ra', ':TestSuite<CR>', opts)
keymap.set('n', '<leader>rf', ':TestFile<CR>', opts)
keymap.set('n', '<leader>rl', ':TestLast<CR>', opts)
keymap.set('n', '<leader>rn', ':TestNearest<CR>', opts)
