return {
  {
    "folke/ts-comments.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.comment",
    opts = {
      options = {
        custom_commentstring = function()
          if vim.bo.filetype == "twig" then
            return "{# %s #}"
          end

          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
}
