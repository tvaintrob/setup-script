-- configs for lsp

local lsp_installer = require("nvim-lsp-installer")
local lsp_conf = require("lspconfig")
local configs = require("lspconfig/configs")
local utils = require("lspconfig/util")

configs.bicep = {
	default_config = {
		cmd = { "dotnet", "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll" },
		filetypes = { "bicep" },
		root_dir = utils.root_pattern(".git"),
	},
}

lsp_conf.bicep.setup({})

local on_attach = function(_client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gd",
		"<Cmd>lua vim.lsp.buf.definition()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"K",
		"<Cmd>lua vim.lsp.buf.hover()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gi",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>D",
		"<cmd>lua vim.lsp.buf.type_definition()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>rn",
		"<cmd>lua vim.lsp.buf.rename()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gr",
		"<cmd>lua vim.lsp.buf.references()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>ac",
		"<cmd>CodeActionMenu<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>e",
		"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"[d",
		"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"]d",
		"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>q",
		"<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
		opts
	)
end

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lsp_installer.on_server_ready(function(server)
	local opts = {}

	if server == "sumneko_lua" then
		opts = {
			on_attach = on_attach,
			on_new_config = function(config, root_dir)
				if root_dir == vim.fn.stdpath("config") then
					config.settings = require("lua-dev").setup().settings
				end
			end,
			settings = { Lua = { diagnostics = { globals = { "vim" } } } },
		}
	end

	if server == "tsserver" then
		opts = {
			on_attach = on_attach,
			commands = {
				OrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
			},
		}
	end

	local cmp = require("cmp_nvim_lsp")
	local client_caps = vim.lsp.protocol.make_client_capabilities()

	opts.capabilities = cmp.update_capabilities(client_caps)

	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
