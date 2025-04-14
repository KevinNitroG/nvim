-- NOTE: NvChad Related Mappings
local fn = vim.fn
local cwd = vim.fn.stdpath "config" .. "/"
local config_dir = { cwd }
local utils = require "core.utils"

-- Enter Command Mode
vim.keymap.set("n", "<leader>;", ":", { desc = "General | Enter Command Mode", silent = true })

-- Remove All Text
vim.keymap.set("n", "<leader>R", "<cmd>%d+<cr>", { desc = "General | Remove All Text", silent = true })

-- Yank All Text
vim.keymap.set("n", "<leader>y", "<cmd>%y+<cr>", { desc = "General | Yank All Text", silent = true })

-- Quit
-- vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "General | Quit", silent = true })

-- Write Quit
-- vim.keymap.set("n", "<leader>x", "<cmd>wqa!<cr>", { desc = "General | Write Quit", silent = true })

-- Toggle Tabufline
vim.keymap.set("n", "<leader>ob", function()
  if vim.o.showtabline == 2 then
    vim.o.showtabline = 0
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Tabufline" })
  else
    vim.o.showtabline = 2
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Tabufline" })
  end
end, { desc = "Options | Toggle Tabufline", silent = true })

-- Toggle Statusline
vim.keymap.set("n", "<leader>os", function()
  if vim.o.laststatus == 3 then
    vim.o.laststatus = 0
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Statusline" })
  else
    vim.o.laststatus = 3
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Statusline" })
  end
end, { desc = "Options | Toggle Statusline", silent = true })

-- Toggle Line Number
vim.keymap.set("n", "<leader>ol", function()
  vim.o.number = not vim.o.number
  if vim.o.number then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Line Number" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Line Number" })
  end
end, { desc = "Options | Toggle Line Number", silent = true })

-- Toggle Relative Number
vim.keymap.set("n", "<leader>or", function()
  vim.o.relativenumber = not vim.o.relativenumber
  if vim.o.relativenumber then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Relative Number" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Relative Number" })
  end
end, { desc = "Options | Toggle Relative Number", silent = true })

vim.keymap.set("n", "<leader>oS", function()
  vim.wo.spell = not vim.wo.spell
  if vim.wo.spell then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Spell Check" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Spell Check" })
  end
end, { desc = "Options | Toggle Spell Check", silent = true })

-- Open find theme
-- vim.keymap.set("n", "<leader>ft", function()
--   require("nvchad.themes").open()
-- end, { desc = "NvChad | Open Theme", silent = true })

-- Toggle Theme
vim.keymap.set("n", "<leader>ot", function()
  local opts = require("nvconfig").base46
  require("base46").toggle_theme()
  if opts.theme_toggle == nil or (opts.theme ~= opts.theme_toggle[1] and opts.theme ~= opts.theme_toggle[2]) then
    return
  end
  if opts.theme == opts.theme_toggle[1] then
    vim.notify("Dark Mode", vim.log.levels.INFO, { title = "Theme" })
  else
    vim.notify("Light Mode", vim.log.levels.INFO, { title = "Theme" })
  end
end, { desc = "Options | Toggle Theme", silent = true })

-- Toggle Transparency
vim.keymap.set("n", "<leader>oT", function()
  require("base46").toggle_transparency()
  if require("nvconfig").base46.transparency then
    vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Transparency" })
  else
    vim.api.nvim_set_hl(0, "NotifyBackground", { link = "Normal" })
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Transparency" })
  end
end, { desc = "Options | Toggle Transparency", silent = true })

-- Toggle Wrap
vim.keymap.set("n", "<leader>ow", function()
  vim.wo.wrap = not vim.wo.wrap
  if vim.wo.wrap then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Line Wrap" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Line Wrap" })
  end
end, { desc = "Options | Toggle Wrap", silent = true })

-- Better Down
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Go to upper window
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "General | Go to upper window", silent = true })

-- Go to lower window
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "General | Go to lower window", silent = true })

-- Go to left window
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "General | Go to left window", silent = true })

-- Go to right window
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "General | Go to right window", silent = true })

-- Close window
vim.keymap.set("n", "<leader>w", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd "Bdelete!"
    vim.cmd "silent! close"
  elseif #vim.api.nvim_list_wins() > 1 then
    vim.cmd "silent! close"
  else
    vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
  end
end, { desc = "General | Close window", silent = true })

-- Select All in Normal Mode
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "General | Select All", silent = true })

-- Add size at the top
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "General | Add size at the top", silent = true })

-- Add size at the bottom
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "General | Add size at the bottom", silent = true })

-- Add size at the left
vim.keymap.set(
  "n",
  "<C-Right>",
  "<cmd>vertical resize +2<CR>",
  { desc = "General | Add size at the left", silent = true }
)

-- Add size at the right
vim.keymap.set(
  "n",
  "<C-Left>",
  "<cmd>vertical resize -2<CR>",
  { desc = "General | Add size at the right", silent = true }
)

-- Go to previous buffer
vim.keymap.set("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "General | Go to previous buffer", silent = true })

-- Go to next buffer
vim.keymap.set("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "General | Go to next buffer", silent = true })

-- Close Buffer
vim.keymap.set("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "General | Close Buffer", silent = true })

-- Close Other Buffers
vim.keymap.set("n", "<leader>C", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "General | Close Other Buffers", silent = true })

-- Close Other Buffers
-- NOTE: Not work because <C-c> is interrupt :(
-- vim.keymap.set("n", "<leader><C-c>", function()
--   require("nvchad.tabufline").closeAllBufs(true)
-- end, { desc = "General | Close All Buffers", silent = true })

-- Close buffers from Left
vim.keymap.set("n", "scl", function()
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "General | Close Buffers from Left", silent = true })

-- Close buffers from Right
vim.keymap.set("n", "scr", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
end, { desc = "General | Close Buffers from Right", silent = true })

-- Switch tab with Alt + Num
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- Go to previous tab
vim.keymap.set("n", "<Left>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })

-- Go to next tab
vim.keymap.set("n", "<Right>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })

-- New tab
vim.keymap.set("n", "<Up>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })

-- Close tab
vim.keymap.set("n", "<Down>", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

-- Indent backward
-- vim.keymap.set("n", "<", "<<", { desc = "General | Indent backward", silent = true })

-- Indent forward
-- vim.keymap.set("n", ">", ">>", { desc = "General | Indent forward", silent = true })

-- Move the line up
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "General | Move the line up", silent = true })

-- Move the line down
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "General | Move the line down", silent = true })

-- Move the line up (Insert Mode)
-- vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "General | Move the line up", silent = true })

-- Move the line down (Insert Mode)
-- vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "General | Move the line down", silent = true })

-- Better Down (Visual Mode)
-- vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up (Visual Mode)
-- vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Better Paste (Visual Mode)
vim.keymap.set("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })

-- Indent backward (Visual Mode)
vim.keymap.set("v", "<", "<gv", { desc = "General | Indent backward", silent = true })

-- Indent forward (Visual Mode)
vim.keymap.set("v", ">", ">gv", { desc = "General | Indent forward", silent = true })

-- Move the selected text up (Visual Mode)
-- vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { desc = "General | Move the selected text up", silent = true })

-- Move the selected text down (Visual Mode)
-- vim.keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { desc = "General | Move the selected text down", silent = true })

-- Enter Normal Mode Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode(Terminal)", silent = true })

-- Go to upper window (Terminal)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-j>", { desc = "General | Go to upper window(Terminal)", silent = true })

-- Go to lower window (Terminal)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-k>", { desc = "General | Go to lower window(Terminal)", silent = true })

-- Go to left window (Terminal)
vim.keymap.set("t", "<C-h>", "<C-\\<C-N><C-h>", { desc = "General | Go to left window(Terminal)", silent = true })

-- Go to right window (Terminal)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-l>", { desc = "General | Go to right window(Terminal)", silent = true })

-- Middle Search Result
-- vim.keymap.set("n", "n", "nzz", { desc = "General | Middle Search Result", silent = true })
-- vim.keymap.set("n", "N", "Nzz", { desc = "General | Middle Search Result", silent = true })

-- Word Search Increment
vim.keymap.set("c", "<Tab>", function()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>/<C-r>/"
  end
  return "<C-z>"
end, { desc = "General | Word Search Increment", expr = true })

-- Word Search Decrement
vim.keymap.set("c", "<S-Tab>", function()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>?<C-r>/"
  end
  return "<S-Tab>"
end, { desc = "General | Word Search Decrement", expr = true })

-- Override default x keybind to delete without put into default register
-- vim.keymap.set("n", "X", '"_dd', { desc = "General | Delete Line to Void Register", silent = true })
-- vim.keymap.set("v", "x", '"_d', { desc = "General | Delete Selected to Void Register", silent = true })

-- Disable Default "s" Keymap In Neovim and Replace with custom Windows & TS Swap
vim.keymap.set("n", "s", "<nop>", { desc = "Windows, Buffer, TS Swap", silent = true, remap = true })

-- Find Config Files
vim.keymap.set("n", "<leader>nf", function()
  require("telescope.builtin").find_files {
    prompt_title = "Config Files",
    search_dirs = config_dir,
    cwd = cwd,
  }
end, { desc = "Neovim | Find Config Files", silent = true })

-- Grep Config Files
vim.keymap.set("n", "<leader>ng", function()
  require("telescope.builtin").live_grep {
    prompt_title = "Config Files",
    search_dirs = config_dir,
    cwd = cwd,
  }
end, { desc = "Neovim | Grep Config Files", silent = true })

-- Quick go to row and column
vim.keymap.set("n", "<leader>nG", function()
  vim.ui.input({ prompt = "Enter line number" }, function(row)
    row = row ~= "" and row or 0
    vim.ui.input({ prompt = "Enter char number" }, function(col)
      col = col ~= "" and col or 0
      vim.cmd("call cursor(" .. row .. ", " .. col .. ")")
    end)
  end)
end, { desc = "Neovim | Goto Row & Col", silent = true })

-- Toggle Cheatsheet
vim.keymap.set("n", "<leader>nc", "<cmd>NvCheatsheet<cr>", { desc = "Neovim | Toggle Cheatsheet", silent = true })

-- Inspect
vim.keymap.set("n", "<leader>ni", function()
  if vim.version().minor >= 9 then
    vim.cmd "Inspect"
  else
    vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
  end
end, { desc = "Neovim | Inspect", silent = true }) -- only available on neovim >= 0.9

-- Messages
vim.keymap.set("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

-- Health
vim.keymap.set("n", "<leader>nh", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

-- Version
vim.keymap.set("n", "<leader>nv", function()
  local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
end, { desc = "Neovim | Version", silent = true })

-- Run Code
vim.keymap.set("n", "<leader>nr", function()
  utils.run_code()
end, { desc = "Neovim | Run Code", silent = true })

vim.keymap.set("n", "<leader>np", function()
  vim.notify(vim.api.nvim_buf_get_name(0), vim.log.levels.INFO, { title = "Current File Path" })
end, { desc = "Neovim | Get Current File Path", silent = true })

-- Clean
vim.keymap.set("n", "<leader>pc", "<cmd>Lazy clean<cr>", { desc = "Lazy | Clean", silent = true })

-- Check
vim.keymap.set("n", "<leader>pC", "<cmd>Lazy check<cr>", { desc = "Lazy | Check", silent = true })

-- Debug
vim.keymap.set("n", "<leader>pd", "<cmd>Lazy debug<cr>", { desc = "Lazy | Debug", silent = true })

-- Install
vim.keymap.set("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Lazy | Install", silent = true })

-- Sync
vim.keymap.set("n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy | Sync", silent = true })

-- Log
vim.keymap.set("n", "<leader>pl", "<cmd>Lazy log<cr>", { desc = "Lazy | Log", silent = true })

-- Home
vim.keymap.set("n", "<leader>ph", "<cmd>Lazy home<cr>", { desc = "Lazy | Home", silent = true })

-- Help
vim.keymap.set("n", "<leader>pH", "<cmd>Lazy help<cr>", { desc = "Lazy | Help", silent = true })

-- Profile
vim.keymap.set("n", "<leader>pp", "<cmd>Lazy profile<cr>", { desc = "Lazy | Profile", silent = true })

-- Update
vim.keymap.set("n", "<leader>pu", "<cmd>Lazy update<cr>", { desc = "Lazy | Update", silent = true })

-- Escape
-- vim.keymap.set("i", "jk", "<Esc>", { desc = "General | Enter Normal Mode", silent = true })

-- Split Window
vim.keymap.set("n", "ss", "<cmd>split<cr>", { desc = "General | Split Horizontal", silent = true })
vim.keymap.set("n", "sv", "<cmd>vsplit<cr>", { desc = "General | Split Vertical", silent = true })

-- Close Current Window
vim.keymap.set("n", "sq", "<cmd>close<cr>", { desc = "General | Close Current Windows", silent = true })

-- Move window
vim.keymap.set("n", "sh", "<C-w>H", { desc = "General | Move Window to Far Left", silent = true })
vim.keymap.set("n", "sj", "<C-w>J", { desc = "General | Move Window to Far Down", silent = true })
vim.keymap.set("n", "sk", "<C-w>K", { desc = "General | Move Window to Far Up", silent = true })
vim.keymap.set("n", "sl", "<C-w>L", { desc = "General | Move Window to Far Right", silent = true })
vim.keymap.set("n", "sr", "<C-w>r", { desc = "General | Rotate Window Down/Right", silent = true })
vim.keymap.set("n", "sR", "<C-w>R", { desc = "General | Rotate Window Up/Left", silent = true })

-- Close other windows
vim.keymap.set("n", "<leader>W", "<cmd>only<cr>", { desc = "General | Close Other Windows", silent = true })

-- Save
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "General | Save", silent = true })

-- Clear Search Highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "General | Clear Search Highlight", silent = true })

-- Select All
-- vim.keymap.set("n", "<leader>A", "ggVG", { desc = "General | Select All", silent = true })

-- Quick Fix
vim.keymap.set("n", "]c", "<cmd>cnext<cr>", { desc = "General | Quick Fix Next", silent = true })
vim.keymap.set("n", "[c", "<cmd>cprev<cr>", { desc = "General | Quick Fix Previous", silent = true })

-- Location List
vim.keymap.set("n", "]l", "<cmd>lnext<cr>", { desc = "General | Location List Next", silent = true })
vim.keymap.set("n", "[l", "<cmd>lprev<cr>", { desc = "General | Location List Previous", silent = true })

-- Sort in Visual Mode
vim.keymap.set("v", "<leader>us", ":sort<cr>gv<esc>", { desc = "Utils | Sort", silent = true })
vim.keymap.set("v", "<leader>uu", ":sort u<cr>gv<esc>", { desc = "Utils | Sort Unique", silent = true })

-- Add Executable Permission for File (chmod)
vim.keymap.set("n", "<leader>ux", function()
  if vim.fn.has "unix" == 0 then
    return vim.notify "This isn't available for non UNIX based OS"
  end
  vim.ui.input({ prompt = "Enter filename", default = "%" }, function(filename)
    if filename == nil then
      return
    end
    vim.cmd("!chmod +x " .. filename)
  end)
end, { desc = "Utils | Add Executable Permission", silent = true })

-- Access register with leader
vim.keymap.set(
  { "n", "v", "x", "o" },
  "<leader>1",
  '"+',
  { desc = "General | Enter System Clipboard (+) Register", silent = true }
)
vim.keymap.set(
  { "n", "v", "x", "o" },
  "<leader>2",
  '"*',
  { desc = "General | Enter Selection Clipboard (*) Register", silent = true }
)
vim.keymap.set({ "n", "v", "x", "o" }, "<leader>0", '"_', { desc = "General | Enter Void Register", silent = true })
