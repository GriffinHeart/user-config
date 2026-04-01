vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        reportMissingImports = "error",
        reportMissingModuleSource = "error",
        reportUnusedImport = "warning",
        reportUnusedVariable = "warning",
      },
    },
  },
})
vim.lsp.enable('pyright')
