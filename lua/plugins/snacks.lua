require("snacks")

return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    scroll = {
      enable = true,
    },
    ---@class snacks.picker.explorer.Config
    explorer = {
      layout = {
        preset = "vscode",
      },
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
