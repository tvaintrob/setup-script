-- neovim plugins

-- install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

local function setup_plugins(use)
	-- manage packer itself
	use("wbthomason/packer.nvim")

	-- general things
	use({ "tvaintrob/bicep.vim" })
	use({ "hashivim/vim-terraform" })
	use({ "f-person/git-blame.nvim", event = { "BufNew", "BufRead" } })
	use({ "norcalli/nvim-colorizer.lua", config = [[require'colorizer'.setup({})]] })

	-- themes
	use({ "projekt0n/github-nvim-theme" })

	-- file viewer
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "tamago324/lir.nvim", config = [[require('configs/lir')]] })

	-- some default plugins
	use({ "tpope/vim-sensible" })
	use({ "airblade/vim-rooter" })
	use({ "luukvbaal/stabilize.nvim" })
	use({ "tpope/vim-repeat", event = { "BufRead", "BufNew" } })
	use({ "tpope/vim-surround", event = { "BufRead", "BufNew" } })
	use({ "tpope/vim-commentary", event = { "BufRead", "BufNew" } })

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = [[require('configs/lualine')]],
		requires = { "arkav/lualine-lsp-progress" },
	})

	-- treesitter
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = [[require('configs/treesitter')]],
	})

	-- telescope
	use({ "junegunn/fzf.vim", requires = { { "junegunn/fzf" } } })
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = [[require('configs/telescope')]],
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})

	-- formatter
	use({ "brentyi/isort.vim", ft = "python" })
	use({
		"mhartington/formatter.nvim",
		event = { "BufNew", "BufRead" },
		config = [[require('configs/formatter')]],
	})

	-- language server
	use({
		"neovim/nvim-lspconfig",
		event = { "BufNew", "BufRead", "BufWinEnter" },
		config = [[require('configs/lsp_conf')]],
		requires = {
			{ "folke/lua-dev.nvim" },
			{ "ray-x/lsp_signature.nvim" },
			{ "williamboman/nvim-lsp-installer" },
		},
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = [[ require("trouble").setup({}) ]],
	})

	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	use({
		"hrsh7th/nvim-cmp",
		config = [[ require('configs/nvim_cmp') ]],
		requires = {
			{ "hrsh7th/vim-vsnip" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "onsails/lspkind-nvim" },
		},
	})
end

return require("packer").startup({
	setup_plugins,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
