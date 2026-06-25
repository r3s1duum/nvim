local map = vim.keymap.set

-- LazyVim-style window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- LazyVim: <leader>w proxies to <C-w>; <leader>ww cycles windows
map("n", "<leader>ww", "<C-w>w", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-w>c", { desc = "Delete Window", remap = true })
map("n", "<leader>-", "<C-w>s", { desc = "Split Below", remap = true })
map("n", "<leader>|", "<C-w>v", { desc = "Split Right", remap = true })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Save / quit
map({ "i", "n", "x", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Clear search on escape
map("n", "<Esc>", "<cmd>noh<cr><Esc>", { desc = "Clear Search Highlight" })

-- Telescope keymaps: see plugins/telescope.lua

-- Explorer: set in plugins/nvim-tree.lua after setup
