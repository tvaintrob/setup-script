-- setting up key mappings

vim.api.nvim_set_keymap("n", "<leader><cr>", ":source $MYVIMRC<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

vim.api.nvim_set_keymap("i", ",", ",<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", { noremap = true })

-- window movements
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- move lines up and down
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- quickly open new terminal buffers
vim.api.nvim_set_keymap("n", "<leader>t", ":bo 15 split | terminal<cr>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<leader>t", "<C-\\><C-N>:vsplit | terminal<cr>a", { noremap = true, silent = true })

-- telescope mappings
-- vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope live_grep<cr>", { noremap = true, silent = true })

-- fzf mappings
vim.api.nvim_set_keymap("n", "<C-p>", ":Files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":Rg<cr>", { noremap = true, silent = true })
