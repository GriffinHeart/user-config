return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_colors = function(colors)
        colors.comment = "#c8c8c8"
        colors.fg_gutter = "#767676"
      end,
      on_highlights = function(hl, _)
        hl.LspInlayHint = { fg = "#767676" }
      end,
    },
  },
  {
    -- Util debug startup slowness
    "dstein64/vim-startuptime",
    lazy = false,
  },
  {
    -- File explorer
    "nvim-tree/nvim-tree.lua",
    lazy = false,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
  },
  {
    "nvim-lualine/lualine.nvim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "MunifTanjim/prettier.nvim", -- prettier as LSP from null-ls
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "glepnir/lspsaga.nvim",
  },
  {
    "onsails/lspkind-nvim",
  },
  { -- lsp status report
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      padding = false,
      auto_preview = false,
      auto_jump = {},
      action_keys = {
        open_split = "s",
        open_vsplit = "v",

        severity = {},
      },
    },
  },
  -- {
  --   'L3MON4D3/LuaSnip'
  -- },
  {
    "rafamadriz/friendly-snippets",
  },
  -- {
  --   'saadparwaiz1/cmp_luasnip'
  -- },
  {
    "giuxtaposition/blink-cmp-copilot",
  },
  {
    "Saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      {
        "giuxtaposition/blink-cmp-copilot",
      },
    },
    opts = {
      completion = {
        documentation = {
          auto_show = true, auto_show_delay_ms = 100
        },
        ghost_text = {
          enabled = true
        }
      },
      signature = { enabled = true },
      keymap = {
        preset = "enter",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
  -- {
  --   'hrsh7th/cmp-buffer'
  -- },
  -- {
  --   'hrsh7th/cmp-path'
  -- },
  -- {
  --   'hrsh7th/cmp-cmdline'
  -- },
  -- {
  --   'hrsh7th/cmp-nvim-lsp'
  -- },
  -- {
  --   'hrsh7th/cmp-nvim-lsp-signature-help'
  -- },
  -- {
  --   'hrsh7th/nvim-cmp'
  -- },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "echasnovski/mini.nvim",
    version = "*",
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    -- indent guides
    "lukas-reineke/indent-blankline.nvim",
  },
  {
    "folke/which-key.nvim",
  },
  {
    "kylechui/nvim-surround",
  },
  {
    "szw/vim-maximizer",
  },
  {
    "windwp/nvim-autopairs",
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "terrortylor/nvim-comment",
  },
  {
    "andymass/vim-matchup",
  },
  {
    "jgdavey/tslime.vim",
  },
  {
    "vim-test/vim-test",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    -- install and manage LSPs/formatters/linters etc
    -- yaml-language-server stylua ruff lua-language-server
    -- check conform.nvim config
    -- check nvim-lint config
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    -- formatter in one api, prefer LSP based approaches
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "ruff_format" },
      },
      default_format_opts = {
        lsp_format = "prefer",
      },
      format_on_save = {
        timeout_ms = 500,
      },
      format_after_save = {
        async = true,
      },
    },
  },
  {
    -- Run linters/formatters etc
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- vale requires to init after installation in vim :! cd ~/.config/vale && vale sync
        markdown = { "markdownlint", "vale" },
        ghaction = { "actionlint" },
        make = { "checkmake" },
        dotenv = { "dotenv_linter" },
      },
    },
    -- nvim-lint doesn't have a setup() fun, manually configure it
    config = function(_, opts)
      require("lint").linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    -- highlight and stripwhitespaces
    "ntpeters/vim-better-whitespace",
    config = function()
      vim.cmd(":EnableWhitespace")
      vim.cmd(":EnableStripWhitespaceOnSave")
    end,
  },
  {
    "elixir-tools/elixir-tools.nvim",
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        elixirls = {
          enable = true,
          settings = elixirls.settings({
            dialyzerEnabled = true,
            incrementalDializer = true,
            fetchDeps = true,
            enableTestLenses = false,
            suggestSpecs = true,
          }),
        },
      })
    end,
  },
}
