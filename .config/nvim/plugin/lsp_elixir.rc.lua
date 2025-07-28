local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- download elixir-ls release and unpack at home
nvim_lsp.elixirls.setup {
-- --	cmd = { "/home/griffo/elixir-ls/language_server.sh" };
  cmd = { "/Users/hugo.almeida/elixir-ls/language_server.sh" },
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      incrementalDialyzer = false
    }
  }
}
