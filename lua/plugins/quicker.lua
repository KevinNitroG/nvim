---@type NvPluginSpec
-- NOTE: Better QuickFixList
return {
  "stevearc/quicker.nvim",
  enabled = false,
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = {},
}
