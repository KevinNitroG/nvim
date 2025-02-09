---@type NvPluginSpec
-- NOTE: vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen. Supports both vim and neovim + tree-sitter.
-- But it may conflict with selection in cmp
return {
  "andymass/vim-matchup",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        enable_quotes = true,
      },
    },
  },
  event = "VeryLazy",
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
