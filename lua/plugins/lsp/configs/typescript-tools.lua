---@type NvPluginSpec
-- NOTE: For Typescript
-- For further information: https://github.com/typescript-language-server/typescript-language-server/blob/HEAD/docs/configuration.md
return {
  "pmizio/typescript-tools.nvim",
  event = "VeryLazy",
  init = function()
    -- NOTE: Rather let Prettier or Eslint do this
    --
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   pattern = {
    --     "*.js",
    --     "*.jsx",
    --     "*.ts",
    --     "*.tsx",
    --   },
    --   command = ":TSToolsSortImports sync",
    -- })
  end,
  opts = {
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      require("plugins.lsp.opts").on_attach(client, bufnr)
    end,
    settings = {
      expose_as_code_action = {
        "fix_all",
        "organize_imports",
      },
      separate_diagnostic_server = true, -- Disable separate diagnostic server
      tsserver_file_preferences = {
        includeCompletionsForModuleExports = true,
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
        preferGoToSourceDefinition = false,
        quotePreference = "auto",
        importModuleSpecifierEnding = "non-relative",
        importModuleSpecifierPreference = "non-relative",
      },
    },
  },
}
