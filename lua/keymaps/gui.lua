local remap = require("keymaps.utils")

local opts = remap.assign({}, remap.force)

vim.g.gui_remapped = false

if not vim.g.gui_remapped then
  vim.g.gui_remapped = true
  -- Clipboard
  remap.common("v", "<D-c>", '"+y', opts)
  remap.common("v", "<D-v>", '"+p', opts)
  remap.common("n", "<D-v>", '"+p', opts)
  remap.common("i", "<D-v>", '<ESC>"+pi', opts)
  remap.common("n", "<D-f>", "ye/\\c<C-r>0<CR>", opts)
  remap.common("v", "<D-f>", "y/\\c<C-r>0<CR>", opts)
  remap.common("n", "<D-a>", "ggVG", opts)
  remap.common("n", "<D-s>", "<cmd>w<CR>")
end

---@param fn_name string
---@param buffer_dir boolean
local search_in_visual_mode = function(fn_name, buffer_dir)
  return function()
    local text = remap.visual_selection()
    if buffer_dir then
      require("telescope.builtin")[fn_name]({
        default_text = text,
        cwd = require("telescope.utils").buffer_dir(),
      })
    else
      require("telescope.builtin")[fn_name]({
        default_text = text,
      })
    end
  end
end

local lsp_remap = function()
  if not vim.g.neovide then
    return
  end

  local keys = require("lazyvim.plugins.lsp.keymaps").get()
  keys[#keys + 1] = { "<D-b>", "<cmd>lua vim.lsp.buf.definition()<cr>" }
end

local telescope_remap = function()
  if vim.g.neovide then
    return {
      { "<D-p>", require("telescope.builtin").find_files },
      {
        "<D-p>",
        search_in_visual_mode("live_grep", false),
        mode = "v",
      },
      -- { "<D-f>", require("telescope.builtin").live_grep },
      -- { "<D-f>", search_in_visual_mode("live_grep", true), mode = "v" },
      { "<D-F>", require("telescope.builtin").live_grep },
      { "<D-F>", search_in_visual_mode("live_grep", false), mode = "v" },
      { "<D-o>", require("telescope.builtin").lsp_document_symbols },
      { "<D-o>", search_in_visual_mode("lsp_document_symbols", false), mode = "v" },
      { "<D-O>", require("telescope.builtin").lsp_dynamic_workspace_symbols },
      { "<D-O>", search_in_visual_mode("lsp_dynamic_workspace_symbols", false), mode = "v" },
      { "<D-P>", "<cmd>Telescope projects<cr>" },
      -- { "<D-d>", require("telescope.actions").delete_buffer },
    }
  else
    return {}
  end
end

return {
  telescope = telescope_remap,
  lsp = lsp_remap,
}
