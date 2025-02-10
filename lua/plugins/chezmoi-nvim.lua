---@type NvPluginSpec
-- NOTE: Chezmoi plugin for neovim
-- For edit and apply
return {
  "xvzc/chezmoi.nvim",
  enabled = vim.fn.executable "chezmoi" == 1,
  init = function()
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { os.getenv "HOME" .. "/.local/share/chezmoi/*" },
      callback = function(ev)
        local bufnr = ev.buf
        local edit_watch = function()
          require("chezmoi.commands.__edit").watch(bufnr)
        end
        vim.schedule(edit_watch)
      end,
    })
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    edit = {
      watch = true,
    },
  },
}
