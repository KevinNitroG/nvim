---@type NvPluginSpec
-- NOTE: autopairs for neovim written in lua
return {
  "windwp/nvim-autopairs",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  event = {
    "InsertEnter",
  },
  init = function()
    vim.keymap.set("n", "<leader>op", function()
      require("nvim-autopairs").toggle()
      if require("nvim-autopairs").state.disabled then
        vim.notify("Toggled Off", vim.log.levels.INFO, { title = "nvim-autopairs" })
      else
        vim.notify("Toggled On", vim.log.levels.INFO, { title = "nvim-autopairs" })
      end
    end, { desc = "Autopairs | Toggle", silent = true })
  end,
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
