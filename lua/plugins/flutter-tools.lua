---@type NvPluginSpec
-- NOTE: For Flutter Development
return {
  "akinsho/flutter-tools.nvim",
  enabled = true,
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  opts = {
    border = vim.g.border_enabled and "rounded" or "none",
    lsp = {
      virtual_text_str = "󱓻 ",
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
  config = true,
}
