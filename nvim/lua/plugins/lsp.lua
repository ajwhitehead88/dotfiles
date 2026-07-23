return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "vtsls", 
            "vue_ls",    
            "astro",    
            "cssls",    
            "html",     
            "eslint",   
            "jsonls",
          },
        },
      },
      {
        "stevearc/conform.nvim",
        opts = {
          ensure_installed = { "prettier" },
          formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            vue = { "prettier" },
          },
          format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
          },
        },
      },
    },
    opts = {
      servers = {
        vtsls = {
          filetypes = {
            "javascript", "javascriptreact", "javascript.jsx",
            "typescript", "typescriptreact", "typescript.tsx",
            "vue",
          },
          settings = {
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
                    languages = { "vue" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
          },
        },
        vue_ls = {},
        astro = {},
        cssls = {},
        html = {},
        eslint = {},
        jsonls = {},
      },
    },
    config = function(_, opts)
      for name, server_opts in pairs(opts.servers) do
        vim.lsp.config(name, server_opts)
        vim.lsp.enable(name)
      end
    end,
  },
}
