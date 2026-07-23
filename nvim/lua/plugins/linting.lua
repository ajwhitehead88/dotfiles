return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    dependencies = {
      {
        "rshkarin/mason-nvim-lint",
        opts = {
          ensure_installed = {
            "stylelint"
          }
        }
      },
    },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        css = { "stylelint" },
        scss = { "stylelint" },
        vue = { "stylelint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  }
}
