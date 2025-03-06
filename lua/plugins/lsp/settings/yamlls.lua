-- NOTE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
return {
  filetypes = {
    "yaml",
    "yaml.docker-compose",
    "yaml.gitlab",
    "yaml.github", -- Manually add custom filetype
  },
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require("schemastore").yaml.schemas {
        ignore = {
          -- "docker-compose.yml",
        },
      },
    },
  },
}
