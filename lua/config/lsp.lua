-- Native Neovim 0.12 LSP (no nvim-lspconfig plugin)

vim.lsp.config("*", {
  root_markers = { ".git" },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt", ".git" },
})

vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyrightconfig.json",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
})

vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "Cargo.lock", "rust-project.json", ".git" },
})

vim.lsp.config("csharp_ls", {
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  root_markers = { ".sln", ".slnx", ".csproj", ".git" },
})

vim.lsp.enable({ "clangd", "pyright", "rust_analyzer", "csharp_ls" })

-- LSP keymaps on attach (LazyVim-style essentials)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("minimal_lsp", { clear = true }),
  callback = function(event)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
    map("n", "gy", vim.lsp.buf.type_definition, "Goto Type Definition")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
    map("n", "]d", function()
      vim.diagnostic.jump({ count = 1 })
    end, "Next Diagnostic")
    map("n", "[d", function()
      vim.diagnostic.jump({ count = -1 })
    end, "Prev Diagnostic")
  end,
})
