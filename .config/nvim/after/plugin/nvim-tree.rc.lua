local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

nvim_tree.setup({
	view = {
		mappings = {
			list = {
				{ key = 'S', action = ''},
				{ key = '<C-x>', action = ''},
				{ key = '<C-v>', action = ''},
				{ key = 'f', action = ''},
				{ key = 'F', action = ''},
				{ key = 'W', action = ''},
				{ key = '<BS>', action = ''},
				{ key = 's', action = 'split'},
				{ key = 'v', action = 'vsplit'},
				{ key = 'X', action = 'collapse_all'},
				{ key = 'x', action = 'close_node'}
			},
		},
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false
			}
		}
	}
})

local opts = { noremap = true }

vim.keymap.set('n', '<leader>ff', '<Cmd>NvimTreeToggle<cr>', opts)
vim.keymap.set('n', '<leader>c', '<Cmd>NvimTreeFindFileToggle<cr>', opts)
vim.keymap.set('n', '<leader>q', '<Cmd>NvimTreeClose<cr>', opts)
