return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      dofile(vim.g.base46_cache .. "mason")
      return require "configs.mason"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    event = "User FilePost",
    config = function()
      require("configs.lspconfig").defaults()
    end,
  },
}
