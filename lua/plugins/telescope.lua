local map = vim.keymap.set
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<Esc>"] = actions.close,
      },
    },
  },
})

-- Telescope keymaps (short — minimal config, few collisions)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>w", function()
  local word = vim.fn.expand("<cword>")
  require("telescope.builtin").grep_string({ search = word })
end, { desc = "Grep Word" })
map("n", "<leader>h", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
