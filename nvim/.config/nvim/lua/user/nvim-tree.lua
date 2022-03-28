local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	git = {
		ignore = false,
	},
	view = {
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "e" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = { "v", "s" }, cb = tree_cb("vsplit") },
			},
		},
		number = false,
		relativenumber = false,
	},
})

vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
