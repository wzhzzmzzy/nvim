-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local utils = require("keymaps.utils")
require("keymaps.gui")

-- if vim.g.neovide then
--   require("keymaps.gui")
-- end

utils.common("n", "<leader>qp", "<cmd>ProjectRoot<cr>", { desc = "Save current project root" })

local show_runnables = function()
  vim.cmd.RustLsp("runnables")
end

utils.common("n", "<leader>cn", show_runnables, { desc = "show runnables" })
