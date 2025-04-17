---@type NvPluginSpec
-- NOTE: Neovim plugin for sqls that leverages the built-in LSP client
return {
  "nanotee/sqls.nvim",
  ft = "sql",
  config = function()
    require("lspconfig").sqls.setup {
      autostart = false,
      on_attach = function(client, bufnr)
        require("sqls").on_attach(client, bufnr)
      end,
    }
  end,
}
