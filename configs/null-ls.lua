local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua,
  lint.selene,

  formatting.prettierd,
  lint.eslint_d,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function on_attach(client, bufnr)
  if not client.supports_method "textDocument/formatting" then
    return
  end

  vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
      -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
      vim.lsp.buf.format { async = false }
    end,
  })
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
