---@type NvPluginSpec
-- NOTE: A treesitter supported autopairing plugin with extensions, and much more
return {
  "altermo/ultimate-autopair.nvim",
  enabled = false,
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  branch = "v0.6", --recommended as each new version will have breaking changes
  opts = {
    -- Add the plugin opts here
  },
}
