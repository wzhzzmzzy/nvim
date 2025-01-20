return {
  "echasnovski/mini.bufremove",

  keys = {
    {
      "<D-w>",
      function()
        vim.cmd.write()
        require("mini.bufremove").delete(0)
      end,
      desc = "Delete Buffer",
    },
  },
}
