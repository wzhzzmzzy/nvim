local toggle_filter = function(state)
  local node = state.tree:get_node()
  require("telescope.builtin").live_grep({
    search_dirs = {
      node.path,
    },
  })
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      width = 30,
      mappings = {
        ["o"] = "open",
        ["v"] = "open_vsplit",
        ["<D-f>"] = toggle_filter,
      },
    },
  },
}
