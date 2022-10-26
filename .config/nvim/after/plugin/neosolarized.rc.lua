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

Color.new('cursorLineColor', '#1a343b')
Color.new('black', '#000000')
Group.new('CursorLine', colors.none, colors.cursorLineColor, styles.NONE, colors.base03)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)
