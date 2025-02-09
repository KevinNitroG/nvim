---@type NvPluginSpec
-- NOTE: Default Plugins
return {
  -- NvChad Default Terminal
  {
    "NvChad/nvterm",
    enabled = false,
  },
  {
    "NvChad/ui",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
    init = function()
      vim.api.nvim_create_user_command("NvChadBase46LoadAllHighLights", function()
        require("base46").load_all_highlights()
      end, { desc = "NvChad | Base46 Load All Highlights" })
    end,
  },
  {
    "nvzone/minty",
    dependencies = { "nvzone/volt" },
    cmd = { "Shades", "Huefy" },
    init = function()
      vim.keymap.set("n", "<leader>uh", "<cmd>Huefy<cr>", { desc = "Minty | Huefy", silent = true })
      vim.keymap.set("n", "<leader>us", "<cmd>Shades<cr>", { desc = "Minty | Shades", silent = true })
    end,
  },
  {
    "nvzone/menu",
    dependencies = { "nvzone/volt" },
    enabled = false,
    event = "VeryLazy",
  },
  {
    "nvzone/showkeys",
    dependencies = { "nvzone/volt" },
    cmd = "ShowkeysToggle",
    init = function()
      vim.keymap.set("n", "<leader>ok", "<cmd>ShowkeysToggle<cr>", { desc = "Showkeys | Toggle", silent = true })
    end,
  },
}
