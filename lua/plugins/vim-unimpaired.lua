---@type NvPluginSpec
-- NOTE: Unimpaired keymaps
-- "." function not work!
-- "]o", "[o" is duplicate with treesitter
return {
  "tpope/vim-unimpaired",
  cond = false,
  event = "VeryLazy",
}
