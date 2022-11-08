local status, surround = pcall(require, 'nvim-surround')
if (not status) then
	print('nvim-surround not installed')
	return
end

surround.setup({})
