---@type NvPluginSpec
-- NOTE: For Typescript
-- For further information: https://github.com/typescript-language-server/typescript-language-server/blob/HEAD/docs/configuration.md
return {
  "pmizio/typescript-tools.nvim",
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
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = {
    -- root_dir = function(fname)
    --   -- NOTE: https://github.com/pmizio/typescript-tools.nvim/blob/master/lua/typescript-tools/init.lua
    --   local util = require "lspconfig.util"
    --
    --   local deno = require("plugins.lsp.settings.denols").root_dir(fname)
    --   if deno ~= "" then
    --     return
    --   end
    --
    --   local root_dir = util.root_pattern "tsconfig.json"(fname)
    --     or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
    --
    --   local node_modules_index = root_dir and root_dir:find("node_modules", 1, true)
    --   if node_modules_index and node_modules_index > 0 then
    --     root_dir = root_dir:sub(1, node_modules_index - 2)
    --   end
    --
    --   return root_dir
    -- end,
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
