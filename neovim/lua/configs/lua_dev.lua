local lsp_config = require("lspconfig")
local lua_dev = require("lua-dev")

lsp_config.lua.setup({
	on_new_config = function(config, root_dir)
		if root_dir == vim.fn.stdpath("config") then
			config.settings = lua_dev.setup().settings
		end
	end,
})
