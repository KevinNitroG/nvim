--NOTE: Supertab setup referenced from LazyVim documentation
-- Supertab from LazyVim: https://www.lazyvim.org/configuration/recipes#supertab
-- Suppertab from cmp: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
-- Copilot tab completion: https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#tab-completion-configuration-highly-recommended
-- Neogen tab cycling: https://github.com/danymat/neogen?tab=readme-ov-file#default-cycling-support

local setup_supertab_forward = function()
  local cmp = require "cmp"
  local luasnip = require "luasnip"

  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

  return cmp.mapping(function(fallback)
    if cmp.visible() then
      -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
      cmp.select_next_item()
    elseif luasnip.locally_jumpable(1) then
      luasnip.jump(1)
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" })
end

local setup_supertab_backward = function()
  local cmp = require "cmp"
  local luasnip = require "luasnip"

  return cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.locally_jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" })
end

-- NOTE: Ref: https://github.com/hrsh7th/nvim-cmp/issues/429#issuecomment-954121524
local setup_toggle_autocomplete_menu = function()
  local cmp = require "cmp"
  return cmp.mapping {
    i = function()
      if cmp.visible() then
        cmp.abort()
      else
        cmp.complete()
      end
    end,
    c = function()
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end,
  }
end

local setup_cr = function()
  local cmp = require "cmp"
  local luasnip = require "luasnip"

  return cmp.mapping(function(fallback)
    if cmp.visible() then
      if luasnip.expandable() then
        luasnip.expand()
      else
        cmp.confirm {
          select = true,
        }
      end
    else
      fallback()
    end
  end)
end

---@type NvPluginSpec
-- NOTE: Completion Engine
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  init = function()
    vim.keymap.set("n", "<leader>oa", function()
      vim.g.toggle_cmp = not vim.g.toggle_cmp
      if vim.g.toggle_cmp then
        vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
      else
        vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
      end
    end, { desc = "Options | Toggle Autocomplete" })
  end,
  opts = function(_, opts)
    table.insert(opts.sources, 1, { name = "copilot" })
    table.insert(opts.sources, 3, { name = "emoji" })
    -- table.insert(opts.sources, 2, { name = "codeium" })
    -- table.insert(opts.sources, 1, { name = "supermaven" })

    opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      -- You can add here new mappings.
      ["<Tab>"] = setup_supertab_forward(),
      ["<S-Tab>"] = setup_supertab_backward(),
      ["<A-;>"] = setup_toggle_autocomplete_menu(), -- For Windows Terminal: Send Ctrl+Space into Alt+;
      ["<C-Space>"] = setup_toggle_autocomplete_menu(),
      ["<Down>"] = require("cmp").mapping.select_next_item(),
      ["<Up>"] = require("cmp").mapping.select_prev_item(),
      ["<CR>"] = setup_cr(),
    })

    -- opts.preselect = require("cmp").PreselectMode.None -- Disable Enter to select without choosing suggestion. Config along with mapping["<CR>"]

    opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect

    opts.enabled = function()
      return (vim.g.toggle_cmp and vim.bo.buftype == "")
    end

    -- Setup for dadbod
    require("cmp").setup.filetype({
      "mysql",
      "plsql",
      "sql",
    }, {
      sources = {
        { name = "copilot", priority = 0 },
        { name = "vim-dadbod-completion", priority = 0 },
        { name = "buffer", priority = 1 },
        { name = "luasnip", priority = 1 },
      },
    })

    require("luasnip").filetype_extend("javascriptreact", { "html" })
    require("luasnip").filetype_extend("typescriptreact", { "html" })
    require("luasnip").filetype_extend("svelte", { "html" })
    require("luasnip").filetype_extend("vue", { "html" })
    require("luasnip").filetype_extend("php", { "html" })
    require("luasnip").filetype_extend("javascript", { "javascriptreact" })
    require("luasnip").filetype_extend("typescript", { "typescriptreact" })

    --NOTE: add border for cmp window
    if vim.g.border_enabled then
      opts.window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      }
    end
  end,
  dependencies = {
    -- For Rust
    {
      "saecki/crates.nvim",
      tag = "v0.4.0",
      opts = {},
    },
    -- Commandline completions
    {
      "hrsh7th/cmp-cmdline",
      config = function()
        local cmdline_mappings = vim.tbl_extend("force", {}, require("cmp").mapping.preset.cmdline(), {
          -- ["<CR>"] = { c = require("cmp").mapping.confirm { select = true } },
        })

        require("cmp").setup.cmdline(":", {
          mapping = cmdline_mappings,
          sources = {
            { name = "cmdline" },
          },
        })
      end,
    },
    -- AI Autocomplete
    {
      "Exafunction/codeium.nvim",
      enabled = false,
      opts = {
        enable_chat = true,
      },
    },
    -- AI Copilot
    {
      "zbirenbaum/copilot-cmp",
      opts = {
        event = {
          "InsertEnter",
          "LspAttach",
        },
        fix_pairs = true,
      },
      config = true,
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
      build = vim.g.os == "Windows" and "make install_jsregexp CC=gcc.exe SHELL=sh.exe .SHELLFLAGS=-c"
        or "make install_jsregexp",
    },
    {
      "hrsh7th/cmp-emoji",
    },
  },
}
