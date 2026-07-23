return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
      },
    },
    config = function()
      require("nvim-treesitter").install({
        "tsx", "vue", "html", "css", "javascript", "typescript", "astro",
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescript", "typescriptreact", "vue", "html", "css", "javascript", "astro" },
        callback = function(args)
          vim.treesitter.start(args.buf)
        end,
      })
    end, 
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    opts = {},
    init = function()
      vim.g.no_plugin_maps = true
    end,
  },
}
