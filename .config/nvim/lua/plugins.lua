local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- These 2 disabled until I find a use
  use 'jose-elias-alvarez/null-ls.nvim' -- Make neovim a language server for prettier
  use 'MunifTanjim/prettier.nvim' -- prettier as LSP from null-ls

  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  -- sources for cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'    
     
  -- File explorer
  use 'nvim-tree/nvim-tree.lua'

  use 'alexghergh/nvim-tmux-navigation'

  -- indent guides
  use 'lukas-reineke/indent-blankline.nvim'

  use 'folke/which-key.nvim'

  use 'tpope/vim-fugitive'

  -- additional
  use 'kylechui/nvim-surround'
  use 'szw/vim-maximizer'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'lewis6991/gitsigns.nvim'

  use 'terrortylor/nvim-comment'
  use 'andymass/vim-matchup'

  use 'jgdavey/tslime.vim'
  use 'vim-test/vim-test'

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
end)
