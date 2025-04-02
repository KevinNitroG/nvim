---@type NvPluginSpec
-- NOTE: Linting
return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  enabled = true,
  config = function()
    -- local linters = require("lint").linters
    -- vim.list_extend(linters.eslint.args, {
    --   "--flag",
    -- "unstable_config_lookup_from_file", -- for fixing file is ignored because it is located outside of the base path on my Windows
    -- })

    require("lint").linters_by_ft = {
      -- cpp = { "cpplint" },
      -- javascript = { "eslint" },
      -- javascriptreact = { "eslint" },
      -- markdown = { "markdownlint" },
      -- python = { "ruff" }, -- Already used ruff-lsp
      -- typescript = { "eslint" },
      -- typescriptreact = { "eslint" },
      bash = { "shellcheck" },
      gitcommit = { "commitlint" },
      github = { "actionlint" },
      latex = { "vale" },
      sh = { "shellcheck" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
      callback = function()
        require("lint").try_lint()
        -- require("lint").try_lint "codespell"
      end,
    })
  end,
}
