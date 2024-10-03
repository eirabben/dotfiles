return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["e"] = "open",
        },
      },
      filesystem = {
        window = {
          mappings = {
            ["/"] = nil,
          },
        },
      },
    },
  },
}
