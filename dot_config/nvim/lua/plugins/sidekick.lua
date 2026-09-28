return {
  {
    "folke/sidekick.nvim",
    init = function()
      -- Sidekick spawns real zellij sessions, which then clutter the zellij
      -- session manager. Isolating them in their own socket dir hides them
      -- from the sessions started by a normal shell.
      vim.env.ZELLIJ_SOCKET_DIR = "/tmp/zellij-sidekick"
    end,
    opts = {
      cli = {
        mux = {
          backend = "zellij",
          enabled = true,
        },
      },
    },
  },
}
