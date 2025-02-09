return {
  "gbprod/yanky.nvim",
  enabled = false,
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope.nvim",
  },
  event = "VeryLazy",
  opts = {
    ring = {
      history_length = 100, --- @type integer Default to 100
      storage = "sqlite",
    },
    highlight = {
      timer = 200,
    },
  },
  init = function()
    vim.keymap.set("n", "<leader>fP", function()
      require("telescope").extensions.yank_history.yank_history {}
    end, { desc = "Telescope | Open Yank History", silent = true })
    vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)", { desc = "Yanky | Yank text", silent = true })
    vim.keymap.set(
      { "n", "x" },
      "p",
      "<Plug>(YankyPutAfter)",
      { desc = "Yanky | Put yanked text after cursor", silent = true }
    )
    vim.keymap.set(
      { "n", "x" },
      "P",
      "<Plug>(YankyPutBefore)",
      { desc = "Yanky | Put yanked text before cursor", silent = true }
    )
    vim.keymap.set(
      { "n", "x" },
      "<leader>Pp",
      "<Plug>(YankyGPutAfter)",
      { desc = "Yanky | Put yanked text after selection", silent = true }
    )
    vim.keymap.set(
      { "n", "x" },
      "<leader>PP",
      "<Plug>(YankyGPutBefore)",
      { desc = "Yanky | Put yanked text before selection", silent = true }
    )
    vim.keymap.set(
      "n",
      "<M-p>",
      "<Plug>(YankyPreviousEntry)",
      { desc = "Yanky | Select previous entry through yank history", silent = true }
    )
    vim.keymap.set(
      "n",
      "<M-n>",
      "<Plug>(YankyNextEntry)",
      { desc = "Yanky | Select next entry through yank history", silent = true }
    )
    vim.keymap.set(
      "n",
      "]p",
      "<Plug>(YankyPutIndentAfterLinewise)",
      { desc = "Yanky | Put indented after cursor (linewise)", silent = true }
    )
    vim.keymap.set(
      "n",
      "[p",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      { desc = "Yanky | Put indented before cursor (linewise)", silent = true }
    )
    vim.keymap.set(
      "n",
      "]P",
      "<Plug>(YankyPutIndentAfterLinewise)",
      { desc = "Yanky | Put indented after cursor (linewise)", silent = true }
    )
    vim.keymap.set(
      "n",
      "[P",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      { desc = "Yanky | Put indented before cursor (linewise)", silent = true }
    )
    vim.keymap.set(
      "n",
      ">p",
      "<Plug>(YankyPutIndentAfterShiftRight)",
      { desc = "Yanky | Put and indent right", silent = true }
    )
    vim.keymap.set(
      "n",
      "<p",
      "<Plug>(YankyPutIndentAfterShiftLeft)",
      { desc = "Yanky | Put and indent left", silent = true }
    )
    vim.keymap.set(
      "n",
      ">P",
      "<Plug>(YankyPutIndentBeforeShiftRight)",
      { desc = "Yanky | Put before and indent right", silent = true }
    )
    vim.keymap.set(
      "n",
      "<P",
      "<Plug>(YankyPutIndentBeforeShiftLeft)",
      { desc = "Yanky | Put before and indent left", silent = true }
    )
    vim.keymap.set(
      "n",
      "=p",
      "<Plug>(YankyPutAfterFilter)",
      { desc = "Yanky | Put after applying a filter", silent = true }
    )
    vim.keymap.set(
      "n",
      "=P",
      "<Plug>(YankyPutBeforeFilter)",
      { desc = "Yanky | Put before applying a filter", silent = true }
    )
  end,
}
