-- NeoVim Config
-- @author Tal Vintrob

-- some default opts
vim.g.mapleader = ","
vim.g.gitblame_date_format = "%r"
vim.g.autoformat_on_save = {
	"lua",
	"yaml",
	"toml",
	"json",
	-- "python",
	-- "javascript",
	-- "javascript.jsx",
	-- "javascriptreact",
	-- "typescript",
	-- "typescript.tsx",
	-- "typescriptreact",
}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.swapfile = false

-- default tab settings,
-- should be overriden by editorconfig
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- resize windowns automatically only horizontaly
vim.opt.eadirection = "hor"

vim.opt.completeopt = { "menu", "menuone", "noselect" }

require("plugins")
require("keymaps")
require("theme")
