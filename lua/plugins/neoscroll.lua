---@type NvPluginSpec
--NOTE: Smooth scrolling neovim plugin written in lua
return {
  "karb94/neoscroll.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    hide_cursor = false,
  },
  config = true,
}
