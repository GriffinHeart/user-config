local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

telescope.setup {
	defaults = {
		mappings = {
			n = {
				['q'] = actions.close,
			},
			i = {
				['<C-s>'] = actions.select_horizontal,
				['<C-v'] = actions.select_vertical,
			},
		},
    file_ignore_patterns = { ".git" },
	},
	extensions = {
		file_browser = {
			theme = 'dropdown',
			hijack_netrw = true,
			mappings = {}
		}
	}
}

-- telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader>t', function()
	builtin.find_files(themes.get_ivy({
		no_ignore = false,
		hidden = true,
		layout_config = { prompt_position = 'bottom', height = 10 },
		sorting_strategy = 'descending',
	}))
end)

vim.keymap.set('n', '<leader>fg', function()
	builtin.live_grep()
end)

vim.keymap.set('n', '<leader>fb', function()
	builtin.buffers(themes.get_ivy({
		no_ignore = false,
		hidden = true,
		layout_config = { prompt_position = 'bottom', height = 10 },
		sorting_strategy = 'descending',
	}))
end)

vim.keymap.set('n', '<leader>fs', function()
	builtin.lsp_document_symbols()
end)


vim.keymap.set('n', '<leader>fh', function()
	builtin.help_tags()
end)
