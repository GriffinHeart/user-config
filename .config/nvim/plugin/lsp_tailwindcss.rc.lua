vim.lsp.config('tailwindcss', {
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
})
vim.lsp.enable('tailwindcss')
