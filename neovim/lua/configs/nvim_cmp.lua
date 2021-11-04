local cmp = require("cmp")
local types = require("cmp.types")
local mapping = require("cmp.config.mapping")

local WIDE_HEIGHT = 40

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 100 },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "buffer", priority = 0 },
	}),

	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},

	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
		maxwidth = math.floor(
			(WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))
		),
		maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
	},

	formatting = {
		format = require("lspkind").cmp_format({
			with_text = true,
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[Buffer]",
			},
		}),
	},

	mapping = {
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping.close(),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = mapping(
			mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
			{ "i", "c" }
		),
		["<C-k>"] = mapping(
			mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
			{ "i", "c" }
		),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
})
