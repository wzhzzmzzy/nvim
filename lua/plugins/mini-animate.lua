if true then
  return {}
end

return {
  "echasnovski/mini.animate",

  opts = {
    cursor = {
      enable = false,
    },
    scroll = {
      enable = vim.g.vscode and false or true,
    },
    open = {
      enable = false,
    },
    resize = {
      enable = false,
    },
    close = {
      enable = false,
    },
  },
}
