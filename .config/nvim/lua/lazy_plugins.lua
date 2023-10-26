local status, lazy = pcall(require, 'lazy')
if (not status) then
  print('lazy pkg manager not installed')
  return
end

lazy.setup({
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      on_colors = function(colors)
        colors.comment = "#767676"
        colors.fg_gutter = "#767676"
      end
    }
  },
  {
    -- Util debug startup slowness
    'dstein64/vim-startuptime',
    lazy = false,
  },
  {
    -- File explorer
    'nvim-tree/nvim-tree.lua',
    lazy = false,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    lazy = false
  },
  {
    'nvim-lualine/lualine.nvim'
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  {
    'jose-elias-alvarez/null-ls.nvim' -- Make neovim a language server for prettie
  },
  {
    'MunifTanjim/prettier.nvim' -- prettier as LSP from null-ls
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'glepnir/lspsaga.nvim'
  },
  {
    'onsails/lspkind-nvim'
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

        severity = {}
      }
    },
  },
  {
    'L3MON4D3/LuaSnip'
  },
  {
    'rafamadriz/friendly-snippets'
  },
  {
    'saadparwaiz1/cmp_luasnip'
  },
  {
    'hrsh7th/cmp-buffer'
  },
  {
    'hrsh7th/cmp-path'
  },
  {
    'hrsh7th/cmp-cmdline'
  },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'hrsh7th/cmp-nvim-lsp-signature-help'
  },
  {
    'hrsh7th/nvim-cmp'
  },
  {
    'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-lua/plenary.nvim'
  },
  {
    'nvim-telescope/telescope.nvim'
  },
  {
    'nvim-telescope/telescope-file-browser.nvim'
  },
  {
    -- indent guides
    'lukas-reineke/indent-blankline.nvim'
  },
  {
    'folke/which-key.nvim'
  },
  {
    'kylechui/nvim-surround'
  },
  {
    'szw/vim-maximizer'
  },
  {
    'windwp/nvim-autopairs'
  },
  {
    'windwp/nvim-ts-autotag'
  },
  {
    'lewis6991/gitsigns.nvim'
  },
  {
    'tpope/vim-fugitive'
  },
  {
    'terrortylor/nvim-comment'
  },
  {
    'andymass/vim-matchup'
  },
  {
    'jgdavey/tslime.vim'
  },
  {
    'vim-test/vim-test'
  },
  {
    'simrat39/rust-tools.nvim'
  },
  {
    'mfussenegger/nvim-dap'
  },
  {
    'rcarriga/nvim-dap-ui'
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
    -- install and manage LSPs/formatters/linters etc
    "williamboman/mason.nvim",
    config = function ()
      require("mason").setup()
    end
  },
  {
    -- Run linters/formatters etc
    "mfussenegger/nvim-lint",
    config = function ()
      require("lint").linters_by_ft = {
        markdown = {"markdownlint"}
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },
  {
    -- highlight and stripwhitespaces
    "ntpeters/vim-better-whitespace",
    config = function ()
      vim.cmd(":EnableWhitespace")
    end
  },
  {
    -- integrate with Dash doc app
    "mrjones2014/dash.nvim",
    build = "make install",
    config = function()
      require("dash").setup({
        dash_app_path = '/Applications/Dash 2.app',
      })
    end
  },
})
