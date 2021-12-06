require('gitsigns').setup()

require('neogit').setup({
  disable_commit_confirmation = true,
  commit_popup = {
    kind = "split_above",
  },
  kind = "split_above",
})
