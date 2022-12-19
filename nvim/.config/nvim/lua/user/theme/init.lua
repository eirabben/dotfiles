local M = {}

M.init = function(colorscheme)
  if colorscheme == "embark" then
    vim.g.colors_name = "embark"
  end

  -- Sonokai
  if colorscheme == "sonokai" then
    vim.g.sonokai_style = "espresso"
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_disable_italic_comment = true
    vim.cmd("colorscheme sonokai")
  end

  -- Rose Pine
  if colorscheme == "rose-pine" then
    vim.g.rose_pine_variant = "base"
    vim.cmd("colorscheme rose-pine")
  end

  -- Nightfox
  if colorscheme == "nightfox" then
    vim.cmd("colorscheme nightfox") -- Can also be nordfox, palefox
  end

  -- Nord
  -- vim.cmd('colorscheme nord')

  -- Catppuccin
  if colorscheme == "catppuccin" then
    vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
    require("catppuccin").setup()
    vim.api.nvim_command "colorscheme catppuccin"
  end

  -- Tundra
  if colorscheme == "tundra" then
    require("nvim-tundra").setup({
      transparent_background = false,
      editor = {
        search = {},
        substitute = {},
      },
      syntax = {
        booleans = { bold = true, italic = true },
        comments = { bold = true, italic = true },
        conditionals = {},
        constants = { bold = true },
        functions = {},
        keywords = {},
        loops = {},
        numbers = { bold = true },
        operators = { bold = true },
        punctuation = {},
        strings = {},
        types = { italic = true },
      },
      diagnostics = {
        errors = {},
        warnings = {},
        information = {},
        hints = {},
      },
      plugins = {
        lsp = true,
        treesitter = true,
        cmp = true,
        context = true,
        dbui = true,
        gitsigns = true,
        telescope = true,
      },
      overwrite = {
        colors = {},
        highlights = {},
      },
    })

    vim.opt.background = "dark"
    vim.cmd("colorscheme tundra")
  end
end

return M
