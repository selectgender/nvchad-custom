-- TODO
-- add like the ability to get per-project snippets with .vscode directory and .code-snippet files

local default_on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- loads vscode .code-snippet files
-- im pretty proud of this code :)
local function on_attach(client, bufnr)
  default_on_attach(client, bufnr)

  local root_dir = vim.lsp.buf.list_workspace_folders()[1]
  local vscode_dir = root_dir .. "/.vscode/"
  local vscode_dir_exists = vim.fn.isdirectory(vscode_dir) ~= 0

  if not vscode_dir_exists then
    return
  end

  local code_snippets = vim.split(vim.fn.glob(vscode_dir .. "*.code-snippets"), "\n")

  for _, filename in ipairs(code_snippets) do
    require("luasnip.loaders.from_vscode").load_standalone {
      path = filename,
    }
  end
end

local lspconfig = require "lspconfig"
local servers = {
  -- "lua_ls",
  -- "luau_lsp",
  "tsserver",
  "tailwindcss",
  "svelte",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

require("luau-lsp.server").setup {
  settings = {
    ["luau-lsp"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      sourcemap = {
        enable = true, -- enable sourcemap generation
        autogenerate = true, -- auto generate sourcemap when saving/deleting buffers
      },
      server = {
        types = {
          roblox = true, -- enable roblox api
        },
      },
    },
  },
}
