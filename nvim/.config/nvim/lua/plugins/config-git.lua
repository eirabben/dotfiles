require("gitsigns").setup()

require("neogit").setup({
	disable_commit_confirmation = true,
	commit_popup = {
		kind = "split_above",
	},
	kind = "split_above",
})

vim.api.nvim_set_keymap("n", "<Leader>ng", ":Neogit<CR>", { noremap = true, silent = true })

require("diffview").setup()
