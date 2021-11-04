-- formatter configurations

local CONF = {
	prettier_d = function()
		return {
			exe = "prettierd",
			args = { vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	end,

	prettier = function()
		return {
			exe = "prettier",
			args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	end,

	stylua = function()
		return { exe = "stylua", stdin = true, args = { "-" } }
	end,

	black = function()
		return { exe = "black", stdin = true, args = { "-" } }
	end,

	isort = function()
		return {
			exe = "isort",
			stdin = true,
			args = {
				"-",
				"--profile black",
				"--line-length 88",
				"--lines-between-types 1",
			},
		}
	end,
}

return CONF
