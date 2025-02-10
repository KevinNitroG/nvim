-- NOTE: Autocommands

local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General", { clear = true })

autocmd("VimEnter", {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    -- change to the directory
    if directory then
      vim.cmd.cd(data.file)
      vim.cmd "Telescope find_files"
      -- require("nvim-tree.api").tree.open()
    end
  end,
  group = general,
  desc = "Open Telescope when it's a Directory",
})

-- Enable Line Number in Telescope Preview
autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.opt_local.number = true
  end,
  group = general,
  desc = "Enable Line Number in Telescope Preview",
})

-- Hide folds and Disable statuscolumn in these filetypes
autocmd("FileType", {
  pattern = { "sagaoutline", "nvcheatsheet" },
  callback = function()
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.stc = "" -- not really important
  end,
  group = general,
  desc = "Disable Fold & StatusColumn",
})

-- Remove this if there's an issue
autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    -- In wsl 2, just install xclip
    -- Ubuntu
    -- sudo apt install xclip
    -- Arch linux
    -- sudo pacman -S xclip
    vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
  end,
  group = general,
  desc = "Lazy load clipboard",
})

autocmd("TermOpen", {
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd "startinsert!"
  end,
  group = general,
  desc = "Terminal Options",
})

autocmd("BufReadPost", {
  callback = function()
    local exclude_fts = {
      "gitcommit",
    }
    for _, ft in pairs(exclude_fts) do
      if ft == vim.bo.filetype then
        return
      end
    end
    if fn.line "'\"" > 1 and fn.line "'\"" <= fn.line "$" then
      vim.cmd 'normal! g`"'
    end
  end,
  group = general,
  desc = "Go To The Last Cursor Position",
})

-- NOTE: "gbprod/yanky.nvim" has highlight on yank and put

autocmd("TextYankPost", {
  callback = function()
    if vim.version().minor >= 11 then
      require("vim.hl").on_yank { timeout = 200 }
    else
      require("vim.highlight").on_yank { timeout = 200 }
    end
  end,
  group = general,
  desc = "Highlight when yanking",
})

-- autocmd({ "BufEnter", "BufNewFile" }, {
--   callback = function()
--     vim.o.showtabline = 0
--   end,
--   group = general,
--   desc = "Disable Tabline",
-- })

autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Disable comment on new line
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  group = general,
  desc = "Disable New Line Comment",
})

-- autocmd("FileType", {
--   pattern = { "c", "cpp", "py", "java", "cs" },
--   callback = function()
--     vim.bo.shiftwidth = 4
--   end,
--   group = general,
--   desc = "Set shiftwidth to 4 in these filetypes",
-- })

-- autocmd("BufEnter", {
--   callback = function()
--     local exclude_fts = {
--       "toml",
--       "yaml",
--       "json",
--     }
--     for _, ft in pairs(exclude_fts) do
--       if ft == vim.bo.filetype then
--         return
--       end
--     end
--
--     local exclude_patterns = {
--       [[.*conf.*]],
--       [[.*ini.*]],
--     }
--     for _, pattern in pairs(exclude_patterns) do
--       if vim.regex(pattern):match_str(vim.bo.filetype) then
--         return
--       end
--     end
--
--     vim.b.auto_save_enabled = true
--   end,
--
--   group = general,
--   desc = "Set local Auto Save Enabled",
-- })

-- NOTE: For format on save:
-- If nested = true, dont ":w<cr>" manually on buffer which "vim.b.auto_save_enabled == true"
-- Also there's a bug while typing
-- When nested = false (default), we have to manually ":w<cr>" to format on save

-- autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
--   -- nested = true, -- for format on save
--   callback = function()
--     if not vim.b.auto_save_enabled then
--       return
--     end
--     if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
--       vim.cmd "silent! w"
--     end
--   end,
--   group = general,
--   desc = "Auto Save",
-- })

autocmd("FocusGained", {
  callback = function()
    vim.cmd "checktime"
  end,
  group = general,
  desc = "Update file when there are changes",
})

autocmd("VimResized", {
  callback = function()
    vim.cmd "wincmd ="
  end,
  group = general,
  desc = "Equalize Splits",
})

autocmd("ModeChanged", {
  callback = function()
    if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
      vim.opt.hlsearch = true
    else
      -- vim.opt.hlsearch = false
    end
  end,
  group = general,
  desc = "Highlighting matched words when searching",
})

-- autocmd("FileType", {
--   pattern = { "gitcommit", "markdown", "text", "log" },
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.spell = true
--   end,
--   group = general,
--   desc = "Enable Wrap in these filetypes",
-- })

autocmd("FileType", {
  pattern = {
    "gitcommit",
    "markdown",
    "text",
  },
  callback = function()
    vim.opt_local.spell = true
  end,
  group = general,
  desc = "Enable Spell check in these filetypes",
})

autocmd("FileType", {
  pattern = {
    "log",
    "markdown",
    "grug-far",
  },
  callback = function()
    vim.opt_local.wrap = false
  end,
  group = general,
  desc = "Disable Wrap in these filetypes",
})

-- autocmd("FileType", {
--   pattern = {
--     "markdown",
--   },
--   callback = function()
--     vim.b.minianimate_disable = true
--     vim.b.cinnamon_disable = true
--     local neoscroll_ok, _ = pcall(require, "neoscroll")
--     if neoscroll_ok then
--       vim.cmd "NeoscrollEnableBufferPM"
--     end
--   end,
--   group = general,
--   desc = "Disable animation in these filetype",
-- })

-- autocmd("FileType", {
--   desc = "Set tab width to 2 for specific filetypes",
--   pattern = {
--     "html",
--     "htmlx",
--     "js",
--     "json",
--     "jsonc",
--     "jsx",
--     "md",
--     "toml",
--     "ts",
--     "tsx",
--     "yaml",
--     "yml",
--   },
--   command = "set tabstop=2 shiftwidth=2 expandtab",
--   group = general,
-- })

autocmd("FileType", {
  desc = "Set tab width to 4 for specific filetypes",
  pattern = {
    "c",
    "cpp",
    "cs",
    "py",
  },
  command = "set tabstop=4 shiftwidth=4 expandtab",
  group = general,
})

autocmd("BufReadPre", {
  desc = "Disable inlay hint file patterns",
  pattern = {
    "*/node_modules/*",
    "*/.venv/*",
  },
  callback = function()
    local inlay_hint = vim.lsp.inlay_hint
    inlay_hint.enable(false, inlay_hint.get { bufnr = 0 })
  end,
  group = general,
})

-- NOTE: Taken from LazyVim documentation: https://www.lazyvim.org/configuration/general#auto-commands

local lazyvim = augroup("lazyvim", { clear = true })

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = lazyvim,
  pattern = {
    "Avante",
    "AvanteInput",
    "PlenaryTestPopup",
    "Regexplainer",
    "checkhealth",
    "dbout",
    "gitsigns.blame",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = lazyvim,
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = lazyvim,
  callback = function(event)
    if event.match:match "^%w%w+:[\\/][\\/]" then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = lazyvim,
  pattern = "bigfile",
  callback = function() -- Pass in "ev" if use below schedule to disable syntax highlight
    vim.b.minianimate_disable = true
    vim.b.cinnamon_disable = true
    vim.b.navic_lazy_update_context = true
    vim.b.matchup_matchparen_enabled = 0
    local neoscroll_ok, _ = pcall(require, "neoscroll")
    if neoscroll_ok then
      vim.cmd "NeoscrollEnableBufferPM"
    end
    vim.schedule(function()
      vim.bo[ev.buf].syntax = vim.filetype.match { buf = ev.buf } or ""
    end)
  end,
})

local overseer = augroup("Overseer", { clear = true })

autocmd("FileType", {
  pattern = "OverseerList",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd "startinsert!"
  end,
  group = overseer,
  desc = "Enter Normal Mode In OverseerList",
})

local settings = augroup("settings", { clear = true })

-- Docs about change vim cursor in terminal: https://neovim.io/doc/user/faq.html#faq
autocmd({ "VimEnter", "VimResume" }, {
  desc = "Set Cursor in Neovim",
  command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:Cursor/lCursor,sm:block",
  group = settings,
})

autocmd({ "VimLeave", "VimSuspend" }, {
  desc = "Restore Cursor when exit Neovim",
  command = "set guicursor=a:ver25",
  group = settings,
})

-- Restore terminal i-beam cursor
-- https://github.com/microsoft/terminal/issues/13420
-- autocmd("VimLeave", {
--   desc = "Restore Cursor when VimLeave",
--   command = "set guicursor= | call chansend(v:stderr, '\x1b[ q')",
--   group = settings,
-- })
