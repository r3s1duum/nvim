local api = require("nvim-tree.api")

local function on_attach(bufnr)
  local function opts(desc)
    return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
end

require("nvim-tree").setup({
  on_attach = on_attach,
  view = {
    width = 35,
    relativenumber = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        git = true,
      },
    },
  },
  actions = {
    open_file = {
      window_picker = { enable = false },
    },
  },
  filters = {
    dotfiles = false,
  },
})

local function toggle_explorer()
  api.tree.toggle({ focus = true, find_file = true })
end

vim.keymap.set("n", "<leader>e", toggle_explorer, { desc = "Explorer" })
