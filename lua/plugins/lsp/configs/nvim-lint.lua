---@type NvPluginSpec
-- NOTE: Linting
return {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
  enabled = true,
  config = function()
    local linters = require("lint").linters
    vim.list_extend(linters.ruff.args, {
      "--select=I",
      "--ignore=F401",
    })
    vim.list_extend(linters.eslint.args, {
      "--flag",
      "unstable_config_lookup_from_file", -- for fixing file is ignored because it is located outside of the base path on my Windows
    })

    require("lint").linters_by_ft = {
      -- cpp = { "cpplint" },
      -- markdown = { "markdownlint" },
      bash = { "shellcheck" },
      ghaction = { "actionlint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      latex = { "vale" },
      python = { "ruff" },
      sh = { "shellcheck" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      gitcommit = { "commitlint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter", "CursorHold" }, {
      callback = function()
        require("lint").try_lint()
        require("lint").try_lint "codespell"
      end,
    })
  end,
}
