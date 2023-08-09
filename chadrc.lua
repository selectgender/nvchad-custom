local M = {}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

M.ui = {
  tabufline = {
    enabled = false,
  },
  --[[
  nvdash = {
    load_on_startup = true,

    buttons = {
      { "  Find File", "Spc Spc", "Telescope find_files" },
      { "󰙅 File Tree", ";", "NvimTreeToggle" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
  ]]
}

return M
