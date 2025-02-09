---@type NvPluginSpec
-- NOTE: Visual Studio Code inspired breadcrumbs plugin for the Neovim editor
return {
  "utilyre/barbecue.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  init = function()
    vim.keymap.set("n", "<leader>lB", function()
      require("barbecue.ui").toggle()
    end, { desc = "Barbecue | Toggle Breadcrumbs", silent = true })
  end,
  config = true,
}
