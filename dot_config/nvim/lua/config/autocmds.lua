-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Keep markdown buffers uncluttered: no spellcheck squiggles and no diagnostics
-- (markdownlint / marksman). Runs after LazyVim's `lazyvim_wrap_spell`, so wrap
-- is kept but spell is turned back off.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("markdown_clean_ui", { clear = true }),
  pattern = { "markdown" },
  callback = function(ev)
    vim.opt_local.spell = false
    vim.diagnostic.enable(false, { bufnr = ev.buf })
  end,
})
