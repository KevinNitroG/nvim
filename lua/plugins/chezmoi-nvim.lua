---@type NvPluginSpec
-- NOTE: Chezmoi plugin for neovim
-- For edit and apply
return {
  "xvzc/chezmoi.nvim",
  enabled = vim.fn.executable "chezmoi" == 1,
  init = function()
    local chezmoi_dir = os.getenv "HOME" .. "/.local/share/chezmoi/"
    local exclude_patterns = {
      chezmoi_dir .. "/?(.)chezmoi*",
      chezmoi_dir .. "/?(.)chezmoi*/",
    }

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { chezmoi_dir .. "*" },
      callback = function(args)
        local bufnr = args.buf
        local file_path = vim.fn.expand("%:p", bufnr)
        for _, pattern in ipairs(exclude_patterns) do
          if vim.fn.globpath(file_path, pattern) then
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
