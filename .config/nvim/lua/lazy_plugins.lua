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
    config = function ()
      vim.cmd[[colorscheme tokyonight]]
    end,
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
  }
})
