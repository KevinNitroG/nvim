---@type NvPluginSpec
-- NOTE: Find all keymaps, cmds, autocmds
-- It doesn't recognise keymaps and autocmds defined by user
return {
  "mrjones2014/legendary.nvim",
  enabled = false,
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  -- sqlite is only needed if you want to use frecency sorting
  dependencies = {
    "kkharji/sqlite.lua",
  },
  cmd = {
    "Legendary",
    "LegendaryRepeat",
  },
  init = function()
    vim.keymap.set("n", "<F2>", "<cmd>Legendary<cr>", { desc = "Legendary", silent = true })
  end,
  opts = {
    extensions = {
      nvim_tree = true,
      lazy_nvim = true,
      which_key = {
        auto_register = true,
      },
      diffview = true,
      op_nvim = false,
    },
  },
}
