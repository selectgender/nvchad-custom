local M = {}

local hardmode = true

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>fb"] = "",
  },
}

M.general = {
  n = {
    ["<leader>x"] = { "<cmd> bw <CR>", "Kill buffer" },
    ["<leader>X"] = { "<cmd> %bd|e# <CR>", "Kill all buffers except current" },
  },
  v = {
    ["<"] = { "<gv", "Continuous indent" },
    [">"] = { ">gv", "Continuous indent" },
  },
}

if hardmode then
  M.general.n["h"] = { "<Nop>", "Disabled" }
  M.general.n["j"] = { "<Nop>", "Disabled" }
  M.general.n["k"] = { "<Nop>", "Disabled" }
  M.general.n["l"] = { "<Nop>", "Disabled" }
  M.general.n["<Left>"] = { "<Nop>", "Disabled" }
  M.general.n["<Down>"] = { "<Nop>", "Disabled" }
  M.general.n["<Up>"] = { "<Nop>", "Disabled" }
  M.general.n["<Right>"] = { "<Nop>", "Disabled" }
  M.general.n["<PageUp>"] = { "<Nop>", "Disabled" }
  M.general.n["<PageDown>"] = { "<Nop>", "Disabled" }
  M.general.n["+"] = { "<Nop>", "Disabled" }
  M.general.n["-"] = { "<Nop>", "Disabled" }
end

--[[
M.nvimtree = {
  n = {
    [";"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}
]]

M.oil = {
  plugin = true,
  n = {
    [";"] = {
      function()
        require("oil").open()
      end,
      "Open oil",
    },
  },
}

M.telescope = {
  n = {
    [","] = { "<cmd> Telescope find_files <CR>", "Find files" },
    -- emacs... ACTIVATE!!!!
    -- ["<M-x>"] = { "<cmd> Telescope commands <CR>", "Find commands" },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<C-a>"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Harpoon add file",
    },
    ["<C-m>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Harpoon quick menu",
    },
    ["<C-n>"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Harpoon next file",
    },
    ["<C-p>"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Harpoon previous file",
    },
  },
}

for i = 1, 9 do
  M.harpoon.n["<C-" .. i .. ">"] = {
    function()
      require("harpoon.ui").nav_file(i)
    end,
    "Harpoon jump to file " .. i,
  }
end

return M
