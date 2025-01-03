---@type NvPluginSpec
return {
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    build = ":Copilot auth",
    cmd = "Copilot",
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
      filetypes = {
        ["copilot-chat"] = false,
      },
    },
    init = function()
      vim.keymap.set(
        "n",
        "<leader>at",
        "<cmd>Copilot toggle<cr>",
        { desc = "Copilot | Toggle Completion", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>ad",
        "<cmd>Copilot disable<cr>",
        { desc = "Copilot | Disable Completion", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>ae",
        "<cmd>Copilot enable<cr>",
        { desc = "Copilot | Enable Completion", silent = true }
      )
      vim.keymap.set("n", "<leader>aP", "<cmd>Copilot panel<cr>", { desc = "Copilot | Toggle Panel", silent = true })

      -- NOTE: Itegrate to nvimp-cmp so that we don't use those keymaps

      -- vim.keymap.set("i", "<M-Right>", function()
      --   require("copilot.suggestion").accept_word()
      -- end, { desc = "Copilot | Accept Word", silent = true })
      -- vim.keymap.set("i", "<M-C-Right>", function()
      --   require("copilot.suggestion").accept_line()
      -- end, { desc = "Copilot | Accept Line", silent = true })
    end,
    config = function(_, opts)
      require("copilot").setup(opts)
      vim.cmd "Copilot disable"
    end,
  },
  {
    "github/copilot.vim",
    cond = false,
    cmd = "Copilot",
    build = ":Copilot setup",
    init = function()
      vim.keymap.set(
        "n",
        "<leader>ad",
        "<cmd>Copilot disable<cr>",
        { desc = "Copilot | Disable Completion", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>ae",
        "<cmd>Copilot enable<cr>",
        { desc = "Copilot | Enable Completion", silent = true }
      )
      vim.keymap.set("n", "<leader>aP", "<cmd>Copilot panel<cr>", { desc = "Copilot | Toggle Panel", silent = true })
      vim.keymap.set("i", "<M-Right>", "<Plug>(copilot-accept-word)", { desc = "Copilot | Accept Word", silent = true })
      vim.keymap.set(
        "i",
        "<M-C-Right>",
        "<Plug>(copilot-accept-line)",
        { desc = "Copilot | Accept Line", silent = true }
      )
      vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Copilot | Show Next Suggestion", silent = true })
      vim.keymap.set(
        "i",
        "<M-[>",
        "<Plug>(copilot-previous)",
        { desc = "Copilot | Show Previous Suggestion", silent = true }
      )
      vim.g.copilot_filetypes = { ["copilot-chat"] = false }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = false,
    branch = "canary",
    cmd = {
      "CopilotChat",
      "CopilotChatClose",
      "CopilotChatCommit",
      "CopilotChatCommitStaged",
      "CopilotChatDebugInfo",
      "CopilotChatDocs",
      "CopilotChatExplain",
      "CopilotChatFix",
      "CopilotChatFixDiagnostic",
      "CopilotChatLoad",
      "CopilotChatModels",
      "CopilotChatOpen",
      "CopilotChatOptimize",
      "CopilotChatReset",
      "CopilotChatReview",
      "CopilotChatSave",
      "CopilotChatStop",
      "CopilotChatTests",
      "CopilotChatToggle",
    },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "zbirenbaum/copilot.lua",
      "github/copilot.vim",
    },
    opts = {
      allow_insecure = true,
      -- Disable default <tab> completion
      mappings = {
        complete = {
          insert = "<Tab>",
        },
      },
      -- window = {
      --   layout = "float",
      --   relative = "cursor",
      --   width = 1,
      --   height = 0.4,
      --   row = 1,
      -- },
    },
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "solarized",
        callback = function()
          vim.api.nvim_set_hl(0, "CopilotSuggestion", {
            ctermfg = "light_grey",
            fg = "light_grey",
            force = true,
          })
        end,
      })

      -- https://github.com/CopilotC-Nvim/CopilotChat.nvim#customizing-buffers
      vim.api.nvim_create_autocmd("BufEnter", {
        desc = "CopilotChat Autocommand",
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = true
          -- C-p to print last response
          vim.keymap.set("n", "<C-p>", function()
            print(require("CopilotChat").response())
          end, { buffer = true, remap = true })
        end,
      })

      vim.keymap.set({ "n", "v" }, "<leader>aq", function()
        local input = vim.fn.input "Quick Chat: "
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end, { desc = "CopilotChat | Quick Chat", silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>ah", function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end, { desc = "CopilotChat | Help Actions", silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>ap", function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end, { desc = "CopilotChat | Prompt Actions", silent = true })
      vim.keymap.set(
        { "n", "v" },
        "<leader>ac",
        "<cmd>CopilotChatToggle<cr>",
        { desc = "CopilotChat | Toggle Chat", silent = true }
      )
      vim.keymap.set("n", "<leader>as", "<cmd>CopilotChatStop<cr>", { desc = "CopilotChat | Stop Chat", silent = true })
      vim.keymap.set("n", "<leader>ar", "<cmd>CopilotChatReset<cr>", { desc = "CopilotChat | Reset", silent = true })
      vim.keymap.set(
        "n",
        "<leader>aS",
        "<cmd>CopilotChatSave<cr>",
        { desc = "CopilotChat | Save Chat History", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>al",
        "<cmd>CopilotChatLoad<cr>",
        { desc = "CopilotChat | Load Chat History", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>am",
        "<cmd>CopilotChatModels<cr>",
        { desc = "CopilotChat | Select Model", silent = true }
      )
    end,
    config = function(_, opts)
      local chat = require "CopilotChat"
      chat.setup(opts)
      require("CopilotChat.integrations.cmp").setup()
    end,
  },
}
