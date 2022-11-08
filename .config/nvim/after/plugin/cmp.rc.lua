local status, cmp = pcall(require, 'cmp')
if (not status or not cmp) then return end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if (not luasnip_status or not luasnip) then return end

local lspkind = require 'lspkind'

require('luasnip/loaders/from_vscode').lazy_load()

-- TODO: Setup keybinds
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	}),
	formatting = {
		format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-u"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show suggestions
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
	}),
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
	'confirm_done', cmp_autopairs.on_confirm_done()
)

vim.cmd [[
	set completeopt=menuone,noinsert,noselect
	highlight! default link CmpItemKind CmpItemMenuDefault
]]
