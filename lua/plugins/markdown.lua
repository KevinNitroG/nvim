---@type NvPluginSpec
-- NOTE: Better Markdown
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = false,
  -- ft = "markdown",
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  cmd = {
    "RenderMarkdown",
  },
  keys = {
    {
      "<leader>mr",
      "<cmd>RenderMarkdown toggle<cr>",
      desc = "Markdown | Toggle Render",
      ft = "markdown",
      silent = true,
    },
  },
  opts = {
    enabled = false,
  },
}
