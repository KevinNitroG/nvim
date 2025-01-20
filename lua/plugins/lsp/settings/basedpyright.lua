return {
  -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    basedpyright = {
      -- If use Ruff's import organizer, uncomment
      -- disableOrganizeImports = true,
      analysis = {
        -- If use ruff, uncomment
        -- ignore = { "*" },
        typeCheckingMode = "standard",
        diagnosticMode = "workspace",
      },
    },
  },
}
