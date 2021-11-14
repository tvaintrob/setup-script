-- formatter.nvim config

local formatter = require("formatter")
local format_configs = require("configs.formatter.configs")
require("configs.formatter.utils")

formatter.setup({
	logging = false,
	filetype = {
		toml = { format_configs.prettier },
		yaml = { format_configs.prettier_d },
		json = { format_configs.prettier_d },
		svelte = { format_configs.prettier_d },
		markdown = { format_configs.prettier_d },
		javascript = { format_configs.prettier_d },
		typescript = { format_configs.prettier_d },
		javascriptreact = { format_configs.prettier_d },
		typescriptreact = { format_configs.prettier_d },
		["javascript.jsx"] = { format_configs.prettier_d },
		["typescript.tsx"] = { format_configs.prettier_d },

		lua = { format_configs.stylua },
		python = { format_configs.isort, format_configs.black },
	},
})

function _G.formatters()
	local config = require("formatter.config")

	for key, _ in pairs(config.values.filetype) do
		print(key)
	end
end

-- formatter keybindings
vim.api.nvim_set_keymap(
	"n",
	"<leader>f",
	":lua format_file()<cr>",
	{ noremap = true, silent = true }
)

-- setup auto formatting for supported filetypes
vim.api.nvim_command([[
    augroup AutoFormat
        autocmd BufWritePost * call v:lua.auto_format()
    augroup END 
]])
