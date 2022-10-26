local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'solarized_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {
			{ 'mode', fmt = function(str) return str:sub(1,1) end }
		},
		lualine_b = {
			{ 'branch', fmt = function(str) return str:sub(1, 10) .. '...' end }
		},
		lualine_c = {
			{ 'filename', file_status = true, path = 0 }
		},
		lualine_x = {
      {
				'diagnostics',
				sources = { "nvim_diagnostic" },
				symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
			},
      'encoding',
      'filetype'
    },
		lualine_y = { 'progress' },
    lualine_z = { 'location' },
	},
	inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
			{ 'filename', file_status = true, path = 1 },
		},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
	},
	tabline = {},
	-- dunno if I'll use
  -- extensions = { 'fugitive' },
}

