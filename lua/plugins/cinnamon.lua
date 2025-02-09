---@type NvPluginSpec
-- NOTE: Smooth scrolling with Cinnamon
return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  cond = false,
  opts = {
    keymaps = {
      basic = true, -- Enable the basic keymaps
      extra = false, -- Enable the extra keymaps
    },
    options = {
      delay = 5, -- Delay between each movement step (in ms)
      max_delta = {
        line = 150, -- Maximum delta for line movements
        column = 200, -- Maximum delta for column movements
        time = 5000,
      },
      mode = "cursor", ---@type "cursor" | "window"
    },
  },
}
