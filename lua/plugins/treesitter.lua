local langs = { "c", "cpp", "c_sharp", "rust", "python", "lua", "vim", "bash", "yaml", "json" }

-- Neovim 0.12: enable highlighting via built-in treesitter runtime
vim.api.nvim_create_autocmd("FileType", {
  pattern = langs,
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Optional: install extra parsers when tree-sitter CLI is available
if vim.fn.executable("tree-sitter") == 1 then
  require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
  })

  vim.schedule(function()
    require("nvim-treesitter").install(langs)
  end)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = langs,
    callback = function()
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end
