return {
	-- Explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
      }
		},
		opts = {
			window = {
				mappings = {
					["/"] = "none", -- "noop" removes default mapping for fuzzy search
					["<space>"] = "none", -- "noop" removes default mapping for fuzzy search
					["g/"] = "fuzzy_finder",
					["l"] = "open",
					["e"] = "open",
					["s"] = "open_vsplit",
					-- ["s"] = "vsplit_with_window_picker",
					["t"] = "open_tabnew",
					["h"] = "close_node",
				},
			},
			filesystem = {
				use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes instead of relying on nvim autocmd events.
			},
		},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
		end,
		config = function(_, opts)
			require("window-picker").setup({
				autoselect_one = true,
				include_current = false,
				filter_rules = {
					-- filter using buffer options
					bo = {
						-- if the file type is one of following, the window will be ignored
						filetype = { "neo-tree", "neo-tree-popup", "notify" },

						-- if the buffer type is one of following, the window will be ignored
						buftype = { "terminal", "quickfix" },
					},
				},
				other_win_hl_color = "#e35e4f",
			})

			require("neo-tree").setup(opts)
		end,
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true })
				end,
				desc = "Open [E]xplorer",
			},
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "[?] Find recently opened files",
			},
			{
				"<leader><space>",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "[ ] Find existing buffers",
			},
			{
				"<leader>/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "[/] Fuzzily search in current buffer]",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "[F]ind [F]iles",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "[F]ind [H]elp",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "[F]ind current [W]ord",
			},
			{
				"<leader>fg",
				function()
					require("telescope").extensions.live_grep_args.live_grep_args()
				end,
				desc = "[F]ind by [G]rep",
			},
			{
				"<leader>fd",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "[F]ind [D]iagnostics",
			},
			{
				"<leader>fa",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "[F]ind [A]gain",
			},
			{
				"<leader>fc",
				function()
					require("telescope.builtin").colorscheme()
				end,
				desc = "[F]ind [C]olorscheme",
			},
			{
				"<leader>gs",
				function()
					require("telescope.builtin").git_status()
				end,
				desc = "Show Changed Files",
			},
		},
		opts = function()
			return {
				defaults = {
					mappings = {},
				},
				extensions = {
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						mappings = {
							i = {
								["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
								["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
									postfix = " --iglob ",
								}),
							},
						},
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			pcall(require("telescope").load_extension, "fzf")
			require("telescope").load_extension("live_grep_args")
		end,
	},

	-- Window navigation
	{
		"numToStr/Navigator.nvim",
		keys = {
			{
				"<C-h>",
				function()
					require("Navigator").left()
				end,
				desc = "Navigate Left",
			},
			{
				"<C-j>",
				function()
					require("Navigator").down()
				end,
				desc = "Navigate Down",
			},
			{
				"<C-k>",
				function()
					require("Navigator").up()
				end,
				desc = "Navigate Up",
			},
			{
				"<C-l>",
				function()
					require("Navigator").right()
				end,
				desc = "Navigate Right",
			},
		},
		config = function()
			require("Navigator").setup()
		end,
	},

	-- Illuminate
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("illuminate").configure()
		end,
	},

	-- Which Key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			defaults = {
				-- mode = { "n", "v" },
				-- ["g"] = { name = "+goto" },
				-- ["gz"] = { name = "+surround" },
				-- ["]"] = { name = "+next" },
				-- ["["] = { name = "+prev" },
				-- ["<leader><tab>"] = { name = "+tabs" },
				-- ["<leader>b"] = { name = "+buffer" },
				-- ["<leader>c"] = { name = "+code" },
				-- ["<leader>f"] = { name = "+file/find" },
				-- ["<leader>g"] = { name = "+git" },
				-- ["<leader>gh"] = { name = "+hunks" },
				-- ["<leader>q"] = { name = "+quit/session" },
				-- ["<leader>s"] = { name = "+search" },
				-- ["<leader>u"] = { name = "+ui" },
				-- ["<leader>w"] = { name = "+windows" },
				-- ["<leader>x"] = { name = "+diagnostics/quickfix" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},

	-- Todo Comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		keys = {
			-- { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
			-- { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
			-- { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			-- { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find Todos" },
			-- { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
		},
	},

  -- Toggleterm
  {
    'akinsho/toggleterm.nvim', version = "*", 
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
      { '<leader>gg', '<cmd>lua _lazygit_toggle()<CR>', desc = 'Open LazyGit' }
    },
    init = function ()
      local Terminal  = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "single",
          width = function()
            return math.floor(vim.o.columns * 0.9)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.9)
          end,
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end
    end,
    config = true,
  }

	-- TODO: Add flit and leap
}
