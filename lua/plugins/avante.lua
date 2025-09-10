return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    opts = {
      debug = false,
      hints = { enabled = false },
      -- provider = "sf-deepseek",
      provider = "deepseek",
      auto_suggestions_provider = "sf-fim",
      behaviour = {
        auto_suggestions = false,
      },
      windows = {
        width = 40,
      },
      providers = {
        deepseek = {
          __inherited_from = "openai",
          endpoint = "https://api.deepseek.com/v1",
          model = "deepseek-chat",
          api_key_name = "DEEPSEEK_API_KEY",
        },
        ["sf-deepseek"] = {
          __inherited_from = "openai",
          endpoint = "https://api.siliconflow.cn/v1",
          model = "deepseek-ai/DeepSeek-V3",
          api_key_name = "SILICON_FLOW_API_KEY",
          disable_tools = true,
        },
        ["sf-fim"] = {
          __inherited_from = "openai",
          endpoint = "https://api.siliconflow.cn/v1",
          -- model = "Qwen/Qwen2.5-32B-Instruct",
          model = "Qwen/Qwen2.5-Coder-32B-Instruct",
          api_key_name = "SILICON_FLOW_FIM_API_KEY",
          disable_tools = true,
        },
        ["friday"] = {
          __inherited_from = "openai",
          endpoint = "https://aigc.sankuai.com/v1/openai/native",
          model = "deepseek-v3-friday",
          api_key_name = "FRIDAY_API_KEY",
          disable_tools = true,
        },
        ["friday-fim"] = {
          __inherited_from = "openai",
          endpoint = "https://aigc.sankuai.com/v1/openai/native",
          model = "Doubao-1.5-pro-32k",
          api_key_name = "FRIDAY_API_KEY",
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
