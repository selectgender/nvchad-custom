vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

vim.filetype.add {
  extension = {
    luau = "luau",
  },
}
