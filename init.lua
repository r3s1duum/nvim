-- Minimal LazyVim-like profile for Neovim 0.12+
-- Launch: NVIM_APPNAME=nvim-minimal nvim  (or: nvim-minimal)

require("config.options")

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/rose-pine/neovim",
  "https://github.com/numToStr/Comment.nvim",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
})

require("plugins.theme")
require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.comments")
require("plugins.treesitter")

require("config.lsp")
require("config.keymaps")
