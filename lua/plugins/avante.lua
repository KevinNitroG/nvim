---@type NvPluginSpec
-- NOTE: Use your Neovim like using Cursor AI IDE!
-- AI chat
return {
  "yetone/avante.nvim",
  enabled = true,
  build = vim.g.os == "Windows" and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  cmd = {
    "AvanteChat",
    "AvanteToggle",
    "AvanteRefresh",
    "AvanteEdit",
  },
  init = function()
    vim.keymap.set(
      { "n", "v" },
      "<leader>ac",
      "<cmd>AvanteToggle<cr>",
      { desc = "Avante | Toggle Chat", silent = true }
    )
    vim.keymap.set("v", "<leader>ar", "<cmd>AvanteRefresh<cr>", { desc = "Avante | Refresh", silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>AvanteEdit<cr>", { desc = "Avante | Edit", silent = true })
  end,
  opts = {
    provider = "copilot",
    behaviour = {
      auto_set_highlight_group = true,
      auto_set_keymaps = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    hints = {
      enabled = true,
    },
    windows = {
      width = 50,
      sidebar_header = {
        enabled = false,
      },
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "OXY2DEV/markview.nvim",
    "zbirenbaum/copilot.lua", -- for providers='copilot'
  },
}
