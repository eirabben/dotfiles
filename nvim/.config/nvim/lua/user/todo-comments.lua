local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	return
end

todo_comments.setup()

vim.api.nvim_set_keymap("n", "<leader>ft", ":TodoTelescope<CR>", { noremap = true })
