return {
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "custom.configs.telescope",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.treesitter",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {},
  },
  {
    "hrsh7th/nvim-cmp",
    -- do you REALLY need completion ALL THE TIME??
    -- I feel like adopting a snippet based workflow is much faster than monkey braining autocomplete
    -- put thought into this and only complete when you need to
    -- <C-SPC> to complete
    -- EXPERIMENTAL: MIGHT REVERT THIS IF THIS ISNT FAST ENOUGH
    opts = {
      completion = { autocomplete = false },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      { "lopi-py/luau-lsp.nvim" },
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "ggandor/flit.nvim",
    dependencies = { "ggandor/leap.nvim" },
    enabled = true,
    keys = function()
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ThePrimeagen/harpoon",
    init = function()
      require("core.utils").load_mappings "harpoon"
    end,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("core.utils").load_mappings "oil"
    end,
    config = true,
  },
}
