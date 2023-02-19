local status, n = pcall(require, 'neosolarized')
if (not status) then return end

n.setup({
	comment_italics = true,
})

local colorbuddy = require('colorbuddy.init')
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local styles = colorbuddy.styles

-- bg = base03 = #002b36
-- base02 = #073642 
Color.new('black', '#000000')

-- previous
--Color.new('cursorLineColor', '#1a343b')
Color.new('cursorLineColor', '#13404d')

Color.new('colorColumnColor', '#062932')

Group.new('CursorLine', colors.none, colors.cursorLineColor, styles.NONE, colors.base03)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('ColorColumn', colors.none, colors.colorColumnColor, styles.NONE, colors.none)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

--vim.cmd([[highlight NonText guifg=#4a4a59]])
--vim.cmd([[highlight SpecialKey guifg=#4a4a59]])

-- previous
-- Color.new('alightgrey', '#9090a2')
Color.new('lightpink', '#e95678')

-- invisible characters
Group.new('NonText', colors.lightpink)
Group.new('SpecialKey', colors.lightpink)
