require("nvim-tree").setup({
  view = {
		mappings = {
			list = {
				{ key = { "l", "e" }, action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = { "v", "s" }, action = "vsplit" },
			},
		},
  }
})

vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { silent = true })
