require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			mappings = {
				i = {
					["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
					["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
				},
			},
		},
	},
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

require("telescope").load_extension("live_grep_args")

