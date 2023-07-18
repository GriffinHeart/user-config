local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- install elixir-ls in ~/elixir-ls
-- nvim_lsp.elixirls.setup {
-- --	cmd = { "/home/griffo/elixir-ls/language_server.sh" };
--   cmd = { "/Users/hugo.almeida/elixir-ls/language_server.sh" },
-- }
