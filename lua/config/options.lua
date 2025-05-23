-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  require("config.gui")
end

vim.opt.swapfile = false
vim.g.lazyvim_eslint_auto_format = true
