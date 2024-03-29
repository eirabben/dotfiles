return {
	-- Treesitter
	-- @TODO: Turn on incremental selection and text objects. Maybe via mini.ai
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"kdl",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"svelte",
				"tsx",
				"twig",
				"typescript",
				"vue",
				"yaml",
				"vim",
				"vimdoc",
			},
		},
		config = function(_, opts)
			vim.g.skip_ts_context_commentstring_module = true
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

-- Old config with useful stuff?
-- incremental_selection = {
-- 	enable = true,
-- 	keymaps = {
-- 		init_selection = "<C-space>",
-- 		node_incremental = "<C-space>",
-- 		scope_incremental = "<C-s>",
-- 		node_decremental = "<C-backspace>",
-- 	},
-- },
-- textobjects = {
-- 	select = {
-- 		enable = true,
-- 		lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
-- 		keymaps = {
-- 			-- You can use the capture groups defined in textobjects.scm
-- 			["aa"] = "@parameter.outer",
-- 			["ia"] = "@parameter.inner",
-- 			["af"] = "@function.outer",
-- 			["if"] = "@function.inner",
-- 			["ac"] = "@class.outer",
-- 			["ic"] = "@class.inner",
-- 		},
-- 	},
-- 	move = {
-- 		enable = true,
-- 		set_jumps = true, -- whether to set jumps in the jumplist
-- 		goto_next_start = {
-- 			["]m"] = "@function.outer",
-- 			["]]"] = "@class.outer",
-- 		},
-- 		goto_next_end = {
-- 			["]M"] = "@function.outer",
-- 			["]["] = "@class.outer",
-- 		},
-- 		goto_previous_start = {
-- 			["[m"] = "@function.outer",
-- 			["[["] = "@class.outer",
-- 		},
-- 		goto_previous_end = {
-- 			["[M"] = "@function.outer",
-- 			["[]"] = "@class.outer",
-- 		},
-- 	},
-- 	swap = {
-- 		enable = true,
-- 		swap_next = {
-- 			["<leader>a"] = "@parameter.inner",
-- 		},
-- 		swap_previous = {
-- 			["<leader>A"] = "@parameter.inner",
-- 		},
-- 	},
