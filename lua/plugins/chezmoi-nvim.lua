---@type NvPluginSpec
-- NOTE: Plugin Description
return {
  "xvzc/chezmoi.nvim",
  cond = vim.fn.executable "chezmoi" == 1,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
}
