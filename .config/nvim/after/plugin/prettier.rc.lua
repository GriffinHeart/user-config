if true then return end -- disable until I find a use
local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup {
	bin = 'prettierd',
	filetypes = {
		'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
		'json', 'yaml', 'markdown', 'css', 'scss', 'less'
	}
}
