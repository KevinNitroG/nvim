---@type NvPluginSpec
-- NOTE: Smooth scrolling with Cinnamon
return {
  "declancm/cinnamon.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "NvimTree" },
      callback = function()
        vim.b.cinnamon_disable = true
      end,
      desc = "Disable Cinnamon in NvimTree",
    })
  end,
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
      mode = "window", ---@type "cursor" | "window"
    },
  },
}
