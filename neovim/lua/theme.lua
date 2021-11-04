-- theme configurations

-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- vim.g.tokyonight_lualine_bold = true

-- vim.g.lualine_theme = "neon"
-- vim.cmd([[ colorscheme neon ]])

-- function _G.custom_highlights()
-- 	vim.cmd([[ highlight LineNr guibg=#1e1f26 ]])
-- 	vim.cmd([[ highlight SignColumn guibg=#1e1f26 ]])
-- 	vim.cmd([[ highlight CursorLineNr guibg=#1e1f26 ]])
-- end

-- vim.cmd([[
--     augroup custom_highlight
--       autocmd!
--       au ColorScheme * call v:lua.custom_highlights()
--     augroup END
-- ]])

vim.g.lualine_theme = "github"

require("github-theme").setup({
	theme_style = "dark",
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
})
