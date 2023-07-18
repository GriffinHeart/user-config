local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach = function()
end

-- brew install lua-language-server
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
      },
      telemetry = {
        enable = false,
      },
    }
  }
}
