local options = {
  base46 = {
    theme = "kanagawa", -- default theme
    hl_add = {},
    hl_override = {},
    integrations = {},
    changed_themes = {},
    transparency = true,
  },

  ui = {
    cmp = {
      icons_left = true, -- only for non-atom styles!
      style = "default", -- default/flat_light/flat_dark/atom/atom_colored
      abbr_maxwidth = 60,
      format_colors = {
        tailwind = true, -- will work for css lsp too
        icon = "󱓻",
      },
    },

    telescope = { style = "bordered" }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = "minimal", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "block",
      order = nil,
      modules = nil,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = true,
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
      bufwidth = 21,
    },
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░    ░░░░░   ░   ░░░░░░░░░   ░   ░   ░░░░░░░   ░",
      "▒  ▒   ▒▒▒   ▒▒   ▒▒▒▒▒▒▒   ▒▒   ▒  ▒   ▒▒▒    ▒",
      "▒   ▒   ▒▒   ▒▒▒   ▒▒▒▒▒   ▒▒▒   ▒   ▒   ▒ ▒   ▒",
      "▓   ▓▓   ▓   ▓▓▓▓   ▓▓▓   ▓▓▓▓   ▓   ▓▓   ▓▓   ▓",
      "▓   ▓▓▓  ▓   ▓▓▓▓▓   ▓   ▓▓▓▓▓   ▓   ▓▓▓  ▓▓   ▓",
      "▓   ▓▓▓▓  ▓  ▓▓▓▓▓▓     ▓▓▓▓▓▓   ▓   ▓▓▓▓▓▓▓   ▓",
      "█   ██████   ███████   ███████   █   ███████   █",
      "████████████████████████████████████████████████",
      "",
      "",
    },

    buttons = {
      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "🚀 Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },
  term = {
    base46_colors = true,
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "simple", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
