-- NOTE: Additional Filetypes
vim.filetype.add {
  extension = {
    ["templ"] = "templ",
    ["json"] = "jsonc",
    ["http"] = "http",
    ["regex"] = "regex",
    ["xaml"] = "xml",
    ["plist"] = "xml",
  },
  pattern = {
    -- [".*/.*%.env.*"] = "env",
    [".*/.*compose%.ya?ml"] = "yaml.docker-compose",
    [".*/.*compose%.override%.ya?ml"] = "yaml.docker-compose",
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
    [".*"] = {
      function(path, buf)
        return vim.bo[buf]
            and vim.bo[buf].filetype ~= "bigfile"
            and path
            and vim.g.bigfile_size
            and vim.fn.getfsize(path) > vim.g.bigfile_size
            and "bigfile"
          or nil
      end,
    },
  },
}
