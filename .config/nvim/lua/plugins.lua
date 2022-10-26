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
	use 'alexghergh/nvim-tmux-navigation'
end)
