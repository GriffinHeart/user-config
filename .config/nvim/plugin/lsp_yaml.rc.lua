local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- install yaml-language-server with :Mason

nvim_lsp.yamlls.setup {}
