return {
  {
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        javascript = { "prettierd" },
        toml = { "taplo" },
        markdown = { "mdformat" },
        python = { "black" },
        zig = { "zigfmt" },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      dofile(vim.g.base46_cache .. "git")
      return require "configs.gitsigns"
    end,
  },
  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
