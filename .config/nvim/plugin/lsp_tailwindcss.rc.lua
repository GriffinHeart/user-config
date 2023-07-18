local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

nvim_lsp.tailwindcss.setup({
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
})
