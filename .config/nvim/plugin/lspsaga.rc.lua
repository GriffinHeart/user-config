local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup({
  hover = {
    open_link = '<cr>',
    open_cmd = '!chrome',
  },
  outline = {
    close_after_jump = true,
    keys = {
      toggle_or_jump = '<cr>',
    },
  },
  definition = {
    keys = {
      edit = '<cr>',
      split = 's',
      vsplit = 'v',
    },
  },
  callhierarchy = {
    layout = 'normal',
    keys = {
      split = 's',
      vsplit = 'v',
    }
  },
  lightbulb = {
    virtual_text = false,
  },
  server_filetype_map = {},
  symbol_in_winbar = { enable = false },
})
