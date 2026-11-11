return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- twig comes from the twig extra.
      vim.list_extend(opts.ensure_installed, {
        "blade",
      })
    end,
  },
}
