return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    python = {
      analysis = {
        -- If use ruff, uncomment, but
        -- ignore = { "*" },
        typeCheckingMode = "standard",
        diagnosticMode = "workspace",
      },
    },
    pyright = {
      -- If use Ruff's import organizer, uncomment
      -- disableOrganizeImports = true,
    },
  },
}
