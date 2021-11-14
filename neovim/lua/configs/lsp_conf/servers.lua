-- lsp servers setup

local lua_dev = require("lua-dev")
local nvim_cmp = require("cmp_nvim_lsp")
local lsp_config = require("lspconfig")
local lsp_config_utils = require("lspconfig/util")
local lsp_installer = require("nvim-lsp-installer")

local keymaps = require("configs.lsp_conf.keymaps")

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local function on_attach(client, bufnr)
	keymaps.set_buf_keymaps(bufnr)
end

lsp_config.bicep.setup({
	cmd = { "dotnet", "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll" },
	root_dir = lsp_config_utils.root_pattern(".git"),
	handlers = handlers,
	on_attach = on_attach,
	filetypes = { "bicep" },
})

lsp_installer.on_server_ready(function(server)
	local capabilities = nvim_cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local opts = { on_attach = on_attach, capabilities = capabilities, handlers = handlers }

	if server.name == "sumneko_lua" then
		server:setup(lua_dev.setup(opts))
	else
		server:setup(opts)
	end

	vim.cmd([[ do User LspAttachBuffers ]])
end)
