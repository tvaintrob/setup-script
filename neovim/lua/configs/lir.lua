-- lir.nvim configs

local lir = require("lir")
local actions = require("lir.actions")

lir.setup({
	show_hidden_files = false,
	devicons_enable = true,
	mappings = {
		["<cr>"] = actions.edit,
		["<C-s>"] = actions.split,
		["<C-v>"] = actions.vsplit,
		["<C-t>"] = actions.tabedit,

		["-"] = actions.up,
		["<esc>"] = actions.quit,

		["K"] = actions.mkdir,
		["N"] = actions.newfile,
		["R"] = actions.rename,
		["Y"] = actions.yank_path,
		["I"] = actions.toggle_show_hidden,
		["D"] = actions.delete,
	},

	float = {
		winblend = 0,
		curdir_window = {
			enable = false,
			highlight_dirname = false,
		},
		win_opts = function()
			return {
				border = require("lir.float.helper").make_border_opts({
					"╭",
					"─",
					"╮",
					"│",
					"╯",
					"─",
					"╰",
					"│",
				}, "Normal"),
			}
		end,
	},
})

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_keymap(
	"n",
	"-",
	":lua require'lir.float'.toggle()<cr>",
	{ noremap = true, silent = true }
)
