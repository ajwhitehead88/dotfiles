vim.keymap.set('n', '<leader>hl', function()
  vim.o.hlsearch = not vim.o.hlsearch
end, { desc = 'Toggle search highlighting' })

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to split below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to split above' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right split' })

vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase split height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease split height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease split width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase split width' })

-- vs code 
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "i" }, "<C-v>", '"+p', { desc = "Paste from system clipboard" })

vim.keymap.set({ "n", "v" }, "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })

