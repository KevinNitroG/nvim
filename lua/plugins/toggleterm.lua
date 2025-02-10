---@type NvPluginSpec
-- NOTE: Terminal Integration
return {
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<leader>tf",
      "<cmd>ToggleTerm direction=float<cr>",
      desc = "ToggleTerm | Float Terminal",
      silent = true,
    },
    {
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<cr>",
      desc = "ToggleTerm | Horizontal Terminal",
      silent = true,
    },
    {
      "<leader>tv",
      "<cmd>ToggleTerm direction=vertical<cr>",
      desc = "ToggleTerm | Vertical Terminal",
      silent = true,
    },
    {
      "<leader>gg",
      require "core.utils".git,
      desc = "ToggleTerm | Lazygit",
      silent = true,
    },
  },
  cmd = {
    "ToggleTerm",
    "ToggleTermSendCurrentLine",
    "ToggleTermSendVisualLines",
    "ToggleTermSendVisualSelection",
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.4
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.5
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = false,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    autochdir = true,
    highlights = {
      NormalFloat = {
        link = "Normal",
      },
      FloatBorder = {
        link = "FloatBorder",
      },
    },
    float_opts = {
      border = "rounded",
      height = math.ceil(vim.o.lines * 1.0 - 4),
      width = math.ceil(vim.o.columns * 1.0),
      winblend = 0,
    },
  },
}
