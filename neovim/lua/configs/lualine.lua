-- configs for lualine

local lualine = require("lualine")
-- local get_mode = require("lualine.utils.mode").get_mode

-- local function fixed_mode()
-- 	local mode = get_mode()

-- 	return string.sub(mode, 0, 1)
-- end

local function line_count()
	return "Lines: " .. tostring(vim.api.nvim_buf_line_count(0))
end

local function file_location()
	return "Ln %l, Col %v"
end

lualine.setup({
	options = {
		theme = vim.g.lualine_theme,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename", "diff" },
		lualine_x = { "lsp_progress", "diagnostics" },
		lualine_y = { "encoding", "filetype" },
		lualine_z = { file_location, line_count },
	},
	extensions = { "quickfix" },
})
