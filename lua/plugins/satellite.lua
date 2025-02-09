---@type NvPluginSpec
-- NOTE: Decorate scrollbar for Neovim
return {
  "lewis6991/satellite.nvim",
  enabled = false,
  event = "VeryLazy",
  keys = {
    {
      "<leader>o<C-s>",
      function()
        if vim.g.satellite then
          vim.cmd "SatelliteDisable"
          vim.g.satellite = false
        else
          vim.cmd "SatelliteEnable"
          vim.g.satellite = true
        end
      end,
      desc = "Satellite | Refresh Scrollbar",
      silent = true,
    },
  },
}
