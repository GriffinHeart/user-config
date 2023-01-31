local status, surround = pcall(require, 'nvim-surround')
if (not status) then return end

-- matchup and surround not working well.
-- cs%{ broken
-- but cs{) works
surround.setup()
