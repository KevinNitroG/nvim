---@type NvPluginSpec
-- NOTE: A very fast, powerful, extensible and asynchronous Neovim HTTP client written in Lua.
return {
  "rest-nvim/rest.nvim",
  name = "rest-nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions_list = { "rest" },
      },
    },
    "luarocks/hererocks",
  },
  keys = {
    { "<leader>AL", "<cmd>Rest log<cr>", desc = "Rest | Log", ft = "http", silent = true },
    { "<leader>Al", "<cmd>Rest last<cr>", desc = "Rest | Last", ft = "http", silent = true },
    { "<leader>AE", "<cmd>Rest env<cr>", desc = "Rest | Env", ft = "http", silent = true },
    { "<leader>Ae", "<cmd>Telescope rest select_env<cr>", desc = "Rest | Telescope Env", ft = "http", silent = true },
    { "<leader>Ar", "<cmd>Rest run<cr>", desc = "Rest | Run", ft = "http", silent = true },
    { "<leader>AR", "<cmd>Rest result<cr>", desc = "Rest | Result", ft = "http", silent = true },
  },
  config = true,
}
