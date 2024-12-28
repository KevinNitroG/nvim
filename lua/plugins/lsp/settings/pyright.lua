return {
  settings = {
    python = {
      analysis = {
        -- If use ruff, uncomment, but
        -- TODO:  check the config again
        -- ignore = { "*" },
        typeCheckingMode = "standard",
        diagnosticMode = "workspace",
      },
    },
    pyright = {
      -- If use Ruff's import organizer, uncomment
      disableOrganizeImports = true,
    },
  },
}
