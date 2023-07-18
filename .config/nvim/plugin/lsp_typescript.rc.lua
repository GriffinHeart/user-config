local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- npm install -g typescript typescript-language-server
nvim_lsp.tsserver.setup {}
