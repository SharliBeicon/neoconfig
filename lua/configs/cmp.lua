return {
  keymap = {
    preset = "default",
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "normal",
    kind_icons = {
      Text = "󰉿",
      Method = "󰊕",
      Function = "󰊕",
      Constructor = "󰒓",

      Field = "󰜢",
      Variable = "󰆦",
      Property = "󰖷",

      Class = "󱡠",
      Interface = "󱡠",
      Struct = "󱡠",
      Module = "󰅩",

      Unit = "󰪚",
      Value = "󰦨",
      Enum = "󰦨",
      EnumMember = "󰦨",

      Keyword = "󰻾",
      Constant = "󰏿",

      Snippet = "󱄽",
      Color = "󰏘",
      File = "󰈔",
      Reference = "󰬲",
      Folder = "󰉋",
      Event = "󱐋",
      Operator = "󰪚",
      TypeParameter = "󰬛",
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "lazydev" },
    providers = {
      lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
    },
  },
  snippets = { preset = "luasnip" },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  signature = { enabled = true },
}
