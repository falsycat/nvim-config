return {
  {
    "navarasu/onedark.nvim",  -- my favorite colorschema
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
      require('onedark').load()
    end
  },
  {
    "nvim-tree/nvim-tree.lua",  -- filebrowser on sidebar
    config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = false,
        },
      })

      -- exit vim automatically when only nvim-tree is remained
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
            vim.cmd("quit")
          end
        end,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",  -- displays add/del at linenumber
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",  -- beautiful status bar
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
        },
      })
    end,
  },
  {
    "echasnovski/mini.align",  -- automatic alignment by `ga` or `gA`
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "uga-rosa/translate.nvim",  -- translation
    config = function()
      require("translate").setup({
        default = {
          command = "google",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",  -- LSP configuration
  },
  {
    "williamboman/mason.nvim",  -- language server management
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",  -- connect between nvim-lspconfig and mason.nvim
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },
        automatic_installation = true,
      })
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
    end,
  },
  {
    "hrsh7th/nvim-cmp",  -- completion
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- by LSP
      "hrsh7th/cmp-buffer",     -- by words in buffer
      "hrsh7th/cmp-path",       -- by file paths
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
  {
    "folke/trouble.nvim",  -- display errors
    config = function()
      require("trouble").setup()
    end,
  },
  {
    'nvim-telescope/telescope.nvim',  -- fuzzy finder
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    "karb94/neoscroll.nvim",  -- smooth scrolling
    config = function()
      require("neoscroll").setup({
        duration_multiplier = 0.3,
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",  -- displays vertical line to express indent
    main = "ibl",
    opts = {},
  },
  {
    "coder/claudecode.nvim",  -- claude code integration
    dependencies = {
      "folke/snacks.nvim",
    },
    config = true,
  },
  {
    "RRethy/vim-illuminate",  -- highlight a word under the cursor
    config = function()
      require("illuminate").configure({
        delay = 100,
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",  -- open split terminal
    config = function()
      require("toggleterm").setup({
        direction = "horizontal", -- horizontal, vertical, float
        size = 15,
      })
    end,
  },
  {
    "folke/which-key.nvim",  -- displays pending keybindings
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup()
      wk.add({
        { "<Leader>c", group = "Claude" },
        { "<Leader>f", group = "Find (Telescope)" },
        { "<Leader>t", group = "Terminal" },
        { "<Leader>r", group = "Refactor (LSP)" },
      })
    end,
  },
}
