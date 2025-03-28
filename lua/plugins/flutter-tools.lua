---@type NvPluginSpec
-- NOTE: For Flutter Development
return {
  "akinsho/flutter-tools.nvim",
  enabled = true,
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
    {
      "nvim-telescope/telescope.nvim",
      opts = function(_, opts)
        opts.extensions_list = vim.list_extend(opts.extensions_list or {}, { "flutter" })
      end,
    },
  },
  opts = {
    border = vim.g.border_enabled and "rounded" or "none",
    lsp = {
      on_attach = function(client, bufnr)
        require("plugins.lsp.opts").on_attach(client, bufnr)
      end,
      capabilities = function()
        return require("plugins.lsp.opts").capabilities
      end,
    },
    setting = {
      analysisExcludedFolders = {
        vim.g.is_windows and vim.fn.expand "$HOME/AppData/Local/Pub/Cache" or nil,
      },
    },
    decorations = {
      statusline = {
        app_version = true,
        device = true,
      },
    },
  },
  opts = {
    lsp = {
      on_attach = function(client, bufnr)
        require("plugins.lsp.opts").on_attach(client, bufnr)
      end,
      capabilities = function()
        return require("plugins.lsp.opts").capabilities
      end,
    },
    setting = {
      analysisExcludedFolders = {
        vim.g.is_windows and vim.fn.expand "$HOME/AppData/Local/Pub/Cache" or nil,
      },
    },
  },
}
