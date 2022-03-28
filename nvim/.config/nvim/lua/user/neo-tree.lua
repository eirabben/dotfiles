local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
	return
end
neo_tree.setup({
	enable_diagnostics = false,
	filesystem = {
		filters = {
			show_hidden = true,
			respect_gitignore = false,
		},
		window = {
			width = 30,
			mappings = {
				["l"] = "open",
				["e"] = "open",
				["h"] = "close_node",
			},
		},
	},
})

vim.api.nvim_set_keymap("n", "<Leader>e", ":NeoTreeRevealToggle<CR>", { noremap = true, silent = true })
