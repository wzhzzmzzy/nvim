return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    opts = {
      debug = true,
      hints = { enabled = false },
      provider = "deepseek",
      auto_suggestions_provider = "deepseek",
      vendors = {
        ["deepseek"] = {
          __inherited_from = "openai",
          endpoint = "https://api.deepseek.com/v1",
          model = "deepseek-chat",
          api_key_name = "DEEPSEEK_API_KEY",
        },
      },
    },
    build = "make",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    ft = function(_, ft)
      vim.list_extend(ft, { "Avante" })
    end,
    opts = function(_, opts)
      opts.file_types = vim.list_extend(opts.file_types or {}, { "Avante" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai" },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "avante.nvim", "saghen/blink.compat" },
    opts = {
      sources = {
        compat = {
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
        default = {
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
        providers = {
          avante_commands = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 90,
            opts = {},
          },
          avante_files = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 100,
            opts = {},
          },
          avante_mentions = {
            name = "avante_mentions",
            module = "blink.compat.source",
            score_offset = 1000, -- show at a higher priority than lsp
            opts = {},
          },
        },
      },
    },
    optional = true,
  },
}
