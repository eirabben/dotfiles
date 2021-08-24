local options = {
  hidden = true, -- Allow a buffer to be in the background
  scrolloff = 5, -- Add padding for cursor
  cursorline = true, -- Highlight current line
  splitright = true, -- Split pane to the right
  splitbelow = false, -- Split pane on bottom
  tabstop = 2, -- Spaces for indentation
  softtabstop = 2, -- Spaces for indentation
  shiftwidth = 2, -- Number of spaces for each indentation
  expandtab = true, -- Use spaces instead of tabs
  smartindent = true, -- Smart indenting
  number = true, -- Show line numbers
  cmdheight = 2, -- More space for messages in cmd line
  hlsearch = true, -- Hightlight search pattern
  ignorecase = true, -- Ignore case when searching
  smartcase = true, -- Case sensitive search when using capital letters
  termguicolors = true, -- Use proper colors in terminal
  updatetime = 300, -- Faster completion
  signcolumn = 'yes', -- Always show signcolumn to stop jumping when showing info
  wrap = true, -- Wrap lines
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
