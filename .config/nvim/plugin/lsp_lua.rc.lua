local opts = {
  settings = {
    Lua = {
      diagnostics = {
        -- recognize the vim global
        globals = { "vim" },
      },
      workspace = {
        -- Let the server know about Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- brew install lua-language-server
local this_os = vim.uv.os_uname().sysname
if this_os:find("Windows") then
  opts.cmd = { vim.env.HOME .. "/lua-language-server/bin/lua-language-server" }
end

vim.lsp.config('lua_ls', opts)
vim.lsp.enable('lua_ls')
