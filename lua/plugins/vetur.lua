local lsputil = require("lspconfig.util")

if vim.env.NVIM_VETUR_ENABLE ~= "1" then
  return {}
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- vtsls = {
      --   enable = false,
      --   root_dir = function()
      --     return nil
      --   end,
      -- },
      volar = {
        enabled = false,
        root_dir = function()
          return nil
        end,
      },
      vuels = {
        root_dir = lsputil.root_pattern("fire.config.js", "vue.config.js", "package.json"),
      },
    },
  },
}
