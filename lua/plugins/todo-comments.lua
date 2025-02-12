---@type NvPluginSpec
-- NOTE: Highlight, List and Search Todo comments in your projects
return {
  "folke/todo-comments.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  cmd = { "TodoTrouble", "TodoLocList", "TodoQuickFix", "TodoTelescope" },
  init = function()
    vim.keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<cr>", { desc = "Todo | Telescope", silent = true })
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Todo | Next Todo" })
    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Todo | Previous Todo" })
  end,
  config = true,
}
