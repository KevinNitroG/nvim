---@type NvPluginSpec
-- NOTE: Improved fzf.vim written in lua
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "FzfLua" },
  keys = {
    { "<leader><leader>", "<cmd>FzfLua files<CR>", desc = "FzfLua | Find Files" },
  },
  opts = {},
}
