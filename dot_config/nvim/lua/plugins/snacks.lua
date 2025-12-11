return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["<Esc>"] = "none",
                  ["s"] = "edit_vsplit",
                  ["e"] = "confirm",
                },
              },
            },
          },
        },
      },
    },
  },
}
