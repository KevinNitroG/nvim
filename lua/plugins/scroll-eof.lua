---@type NvPluginSpec
-- NOTE: Scroll past the end of file just like scrolloff option
return {
  "Aasim-A/scrollEOF.nvim",
  cond = false,
  event = {
    "CursorMoved",
    "WinScrolled",
  },
  opts = {
    -- Add the plugin opts here
  },
}
