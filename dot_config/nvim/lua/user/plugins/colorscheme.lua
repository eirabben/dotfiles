return {

	-- { "catppuccin/nvim", name = "catppuccin" },
	-- { "EdenEast/nightfox.nvim" },
	{ 
    "rose-pine/neovim", 
    name = "rose-pine",
		lazy = false,
		config = function()
			vim.cmd.colorscheme("rose-pine-moon")
		end,
  },
	-- { "rebelot/kanagawa.nvim" },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	opts = { style = "moon" },
	-- 	config = function()
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },
	-- {
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	config = function()
	-- 		require("monokai-pro").setup()
	-- 	end,
	-- },
	--[[ use({ "embark-theme/vim", as = "embark" }) ]]
	--[[ use("sainnhe/sonokai") ]]
	--[[ use("sam4llis/nvim-tundra") ]]
}
