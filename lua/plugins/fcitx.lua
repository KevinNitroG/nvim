---@type NvPluginSpec
return {
  "alohaia/fcitx.nvim",
  enabled = false and (vim.fn.executable "fcitx5" == 1 or vim.fn.executable "fcitx" == 1),
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    require "fcitx"(opts)
  end,
}
