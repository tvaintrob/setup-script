-- utils for formatter config

local M = {}

function M.create_config(options)
	local formatter_config = {}

	-- register all filetypes
	for _, tool in pairs(options) do
		for _, filetype in ipairs(tool.filetypes) do
			formatter_config[filetype] = { tool.format_config }
		end
	end

	return formatter_config
end

function _G.auto_format()
	for _, ft in ipairs(vim.g.autoformat_on_save) do
		if vim.o.filetype == ft then
			_G.format_file()
		end
	end
end

function _G.format_file()
	local formatters = require("formatter.config").values.filetype

	if formatters[vim.o.filetype] then
		vim.api.nvim_command("FormatWrite")
	else
		vim.lsp.buf.formatting()
	end
end

return M
