local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach = function()
end
-- local on_attach = function(client, bufnr)
--  -- formatting
--  if client.server_capabilities.documentFormattingProvider then
--    vim.api.nvim_command [[augroup Format]]
--    vim.api.nvim_command [[autocmd! * <buffer>]]
--    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
--    vim.api.nvim_command [[augroup END]]
--  end
-- end

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- recognize the vim global
        globals = { 'vim' }
      },
      workspace = {
        -- Let the server know about Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true)
      }
    }
  }
}

-- pipx install python-lsp-server[all]
-- user pipx inject python-lsp-server <plugins> to install additional plugins
-- TODO: Revisit these configs after setup
nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        -- TODO: check the other tools configs
        flake8 = {
          enabled = true,
        },
        pylint = {
          enabled = true,
-- npm install -g typescript typescript-language-server
nvim_lsp.tsserver.setup {}

