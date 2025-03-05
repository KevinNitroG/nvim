---@type NvPluginSpec
-- NOTE: Quickly add co-authors to commits
return {
  "2kabhishek/co-author.nvim",
  cmd = {
    "CoAuthor",
  },
  keys = {
    {
      "<leader>gC",
      "<cmd>CoAuthor<CR>",
      desc = "CoAuthor | Find",
      silent = true,
    },
  },
}
