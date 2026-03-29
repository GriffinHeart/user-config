require('lspconfig').pyright.setup {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        reportMissingImports = "error",
        reportMissingModuleSource = "error",
        reportUnusedImport = "warning",
        reportUnusedVariable = "warning",
      }
    }
  }
}
