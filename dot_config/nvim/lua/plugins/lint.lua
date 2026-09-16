return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpstan" },
      },
      linters = {
        phpstan = {
          -- Prefer the project's own phpstan so its version and config are used,
          -- falling back to the mason-installed binary.
          cmd = function()
            local local_bin = vim.fs.find("vendor/bin/phpstan", {
              upward = true,
              path = vim.fn.expand("%:p:h"),
            })[1]
            return local_bin or "phpstan"
          end,
        },
      },
    },
  },
}
