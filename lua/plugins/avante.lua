---@type NvPluginSpec
-- NOTE: AI Chat
return {
  "yetone/avante.nvim",
  enabled = true,
  cmd = {
    "AvanteChat",
    "AvanteToggle",
    "AvanteRefresh",
    "AvanteEdit",
  },
  init = function()
    vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>Avante<cr>", { desc = "Avante | Toggle Chat", silent = true })
    vim.keymap.set("v", "<leader>ar", "<cmd>AvanteRefresh<cr>", { desc = "Avante | Refresh", silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>AvanteEdit<cr>", { desc = "Avante | Edit", silent = true })
  end,
  -- event = "VeryLazy",
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- add any opts here
    -- for example
    provider = "copilot",
    windows = {
      width = 0.2 * vim.o.columns,
      sidebar_header = {
        enabled = false,
      },
    },
    mappings = {
      sidebar = {
        close = { "q" },
      },
    },
    behaviour = {
      auto_set_highlight_group = true,
      auto_set_keymaps = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    hints = {
      enabled = true,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = vim.g.os == "Windows" and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    "OXY2DEV/markview.nvim",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      enabled = false,
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
  },
}
