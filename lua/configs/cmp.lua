return {
  keymap = {
    preset = 'default',
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  appearance = {
    nerd_font_variant = 'normal',
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
}
