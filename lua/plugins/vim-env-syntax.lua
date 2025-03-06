---@type NvPluginSpec
-- NOTE: Vim syntax highlighting plugin for .env files
return {
  "overleaf/vim-env-syntax",
  enabled = false,
  event = {
    "BufReadPost",
    "BufNewFile",
  },
}
