---@type NvPluginSpec
-- NOTE: Chezmoi plugin for neovim
-- For edit and apply
return {
  "xvzc/chezmoi.nvim",
  enabled = vim.fn.executable "chezmoi" == 1,
  init = function()
    local exclude_patterns = {
      [[.*chezmoi.*chezmoi.*]],
    }

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = {
        (vim.fn.expand "~"):gsub("\\", "/") .. "/.local/share/chezmoi/home/*",
      },
      callback = function(args)
        local bufnr = args.buf
        local file_path = vim.fn.expand("%:p", bufnr)
        for _, pattern in ipairs(exclude_patterns) do
          if file_path:match(pattern) then
            return
          end
        end
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
