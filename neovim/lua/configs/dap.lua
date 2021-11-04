local dap_ui = require("dapui")
local dap_install = require("dap-install")
local debuggers = require("dap-install.api.debuggers").get_installed_debuggers()

dap_ui.setup()
dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

for _, debugger in ipairs(debuggers) do
	dap_install.config(debugger)
end

local M
function M.setup_debug_mode()
	-- setup key bindings
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(0, "n", "n", "<cmd>lua require('dap').step_over()<cr>", { noremap = true })
end
