-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/tvaintrob/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/tvaintrob/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/tvaintrob/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/tvaintrob/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tvaintrob/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bicep.vim"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/bicep.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["formatter.nvim"] = {
    config = { "require('configs/formatter')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["git-blame.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/git-blame.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["isort.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/isort.vim"
  },
  ["lir.nvim"] = {
    config = { "require('configs/lir')" },
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/lir.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "require('configs/lualine')" },
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-cmp"] = {
    config = { " require('configs/nvim_cmp') " },
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require'colorizer'.setup({})" },
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "require('configs/lsp')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "require('configs/treesitter')" },
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["stabilize.nvim"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/stabilize.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('configs/telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { ' require("trouble").setup({}) ' },
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/tvaintrob/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require'colorizer'.setup({})
time([[Config for nvim-colorizer.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('configs/lualine')
time([[Config for lualine.nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
require('configs/lir')
time([[Config for lir.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
 require('configs/nvim_cmp') 
time([[Config for nvim-cmp]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
 require("trouble").setup({}) 
time([[Config for trouble.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('configs/treesitter')
time([[Config for nvim-treesitter]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'isort.vim'}, { ft = "python" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufNew * ++once lua require("packer.load")({'vim-commentary', 'formatter.nvim', 'git-blame.nvim', 'nvim-lspconfig', 'vim-repeat', 'vim-surround'}, { event = "BufNew *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-commentary', 'formatter.nvim', 'git-blame.nvim', 'nvim-lspconfig', 'vim-repeat', 'vim-surround'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
