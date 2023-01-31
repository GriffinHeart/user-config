local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'lua',
    'vim',
    'json',
    'yaml',
    'markdown',
    'bash',
    'dockerfile',
    'python',
    'gitignore',
    'elixir',
    'erlang',
    'css',
    'tsx',
  },
  auto_tag = {
    enable = true,
  },
  match_up = {
    enable = true,
  },
}
