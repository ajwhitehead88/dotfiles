return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*", -- pre-built binaries, avoids needing a Rust toolchain
    opts = {
      keymap = { preset = "super-tab" },
    },
  },
}
