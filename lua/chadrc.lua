-- NOTE: NvChad Related Options
---@type ChadrcConfig
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
local M = {}

local highlights = require "highlights"
local headers = require "core.statusline.headers"

local function get_header(default)
  if vim.g.random_header then
    local headerNames = {}
    for name, _ in pairs(headers) do
      table.insert(headerNames, name)
    end

    local randomName = headerNames[math.random(#headerNames)]
    local randomHeader = headers[randomName]
    return randomHeader
  else
    local name = (default == nil or default == "") and "nvchad" or default
    return headers[name]
  end
end

M.ui = {
  telescope = { style = "borderless" }, -- borderless / bordered
  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true,
    },
  },
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = {
      "mode",
      "file",
      "git",
      "command",
      "%=",
      -- "escape_status",
      "lsp_msg",
      "macro_recording",
      "diagnostics",
      "flutter",
      "python_venv",
      "auto_format",
      "lsps",
      "linters",
      "formatters",
      -- "clients",
      "eol_char",
      "cwd",
      "cursor",
      -- "total_lines",
    },
    modules = require("core.statusline").modules,
  },

  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = require("core.tabufline").modules,
  },
}

M.nvdash = {
  load_on_startup = true,
  header = get_header "kevim_ansii_shadow",
  buttons = {
    { txt = "  Find File", cmd = "Telescope find_files" },
    { txt = "─", no_gap = true, rep = true },
    {
      txt = function()
        local ok, stats = pcall(function()
          local lazy_stats = require("lazy").stats()
          return {
            loaded = lazy_stats.loaded,
            count = lazy_stats.count,
            milliseconds = math.floor(lazy_stats.startuptime) .. " ms",
          }
        end)
        if ok then
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. stats.milliseconds
        else
          return "󰇸 Cannot load lazy's status"
        end
      end,
      no_gap = true,
    },
    { txt = "─", no_gap = true, rep = true },
  },
}

M.cheatsheet = { theme = "grid" } -- simple/grid

-- NOTE: NvChad auto recognise from Conform
M.mason = {
  cmd = true,
  -- Use names from mason.nvim
  -- For example, if you want to install "tsserver" you should use "typescript-language-server" in the list below
  pkgs = {
    -- Lua
    "lua-language-server",
    "vim-language-server",
    "stylua",

    -- Web Development
    "css-lsp",
    "emmet-language-server",
    "eslint-lsp",
    "html-lsp",
    "js-debug-adapter",
    "prettier",
    "tailwindcss-language-server",
    "typescript-language-server",
    -- "vtsls",
    -- "deno",
    -- "vue-language-server",

    -- PHP
    -- "intelephense",

    -- C/C++
    "clang-format",
    "clangd",
    "codelldb",
    -- "cpptools",

    -- CMake
    -- "cmake-language-server",
    -- "neocmakelsp",

    -- Java
    -- "jdtls",

    -- Json
    "json-lsp",

    -- Yaml
    "yaml-language-server",

    -- Toml
    "taplo",

    -- Github Action
    "actionlint",

    -- Python
    "basedpyright",
    "debugpy",
    "ruff",
    -- "basedpyright",
    -- "pyright",

    -- C#
    -- "csharpier",
    -- "omnisharp",
    -- "omnisharp-mono",

    -- Go
    -- "gopls",

    -- Markdown
    "doctoc",
    "markdownlint",
    -- "marksman",
    -- "vale_ls",

    -- Shell
    "bash-language-server",
    "beautysh",
    -- "powershell-editor-services",
    "shellcheck",
    "shfmt",

    -- Docker
    "docker-compose-language-service",
    "dockerfile-language-server",

    -- Database
    "sql-formatter",
    -- "sqls",

    -- Others
    -- vim.fn.executable "hyprland" and "hyprls" or nil,
    "codespell",
  },
}

M.lsp = { signature = false }

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  theme_toggle = { "catppuccin", "one_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  integrations = {
    "cmp",
    "dap",
    "defaults",
    "devicons",
    "diffview",
    "lsp",
    "markview",
    "mason",
    "notify",
    "nvimtree",
    "rainbowdelimiters",
    "statusline",
    "telescope",
    "todo",
    "treesitter",
    "trouble",
    "whichkey",
    "blankline",
    "lspsaga", -- override NvChad's background in highlights.lua
  },
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

-- M.lazy_nvim = require "core.lazy" -- config for lazy.nvim startup options

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
