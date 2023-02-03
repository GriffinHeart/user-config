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

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local opts = { noremap = true }

vim.keymap.set('n', '<leader>ff', '<Cmd>NvimTreeToggle<cr>', opts)
vim.keymap.set('n', '<leader>c', '<Cmd>NvimTreeFindFileToggle<cr>', opts)
vim.keymap.set('n', '<leader>q', '<Cmd>NvimTreeClose<cr>', opts)
