return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = { enabled = false },
        window = {
          mappings = {
            ["/"] = nil,
          },
        },
      },
      window = {
        mappings = {
          ["e"] = "open",
        },
      },
    },
  },
}
