---@type NvPluginSpec
-- NOTE: Hover plugin framework for Neovim
return {
  "lewis6991/hover.nvim",
  enabled = false,
  event = "VeryLazy",
  init = function()
    -- Setup keymaps
    vim.keymap.set("n", "K", require("hover").hover, { desc = "Hover | Hover" })
    vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "Hover | Select" })
    vim.keymap.set("n", "<C-p>", function()
      require("hover").hover_switch "previous"
    end, { desc = "Hover | Previous Source" })
    vim.keymap.set("n", "<C-n>", function()
      require("hover").hover_switch "next"
    end, { desc = "Hover | Next Source" })

    -- Mouse support
    -- vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "Hover | Mouse" })
    -- vim.o.mousemoveevent = true
  end,
  opts = {
    init = function()
      -- Require providers
      require "hover.providers.lsp"
      if vim.fn.executable "gh" then
        require "hover.providers.gh"
        require "hover.providers.gh_user"
      end
      -- require('hover.providers.jira')
      require "hover.providers.dap"
      -- require('hover.providers.fold_preview')
      -- require('hover.providers.diagnostic')
      -- require('hover.providers.man')
      require "hover.providers.dictionary"
    end,
    preview_opts = {
      border = vim.g.border_enabled and "rounded" or "single",
    },
  },
}
