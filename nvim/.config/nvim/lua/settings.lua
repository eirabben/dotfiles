local options = {
  backup = false, -- Creates a backup file
  cmdheight = 2, -- More space for messages in cmd line
  completeopt = 'menu,menuone,noselect',
  conceallevel = 0, -- EXPERIMENTAL So `` is visible in markdown
  cursorline = true, -- Highlight current line
  expandtab = true, -- Use spaces instead of tabs
  hidden = true, -- Allow a buffer to be in the background
  hlsearch = true, -- Hightlight search pattern
  ignorecase = true, -- Ignore case when searching
  number = true, -- Show line numbers
  pumheight = 10, -- EXPERIMENTAL Popup menu height
  scrolloff = 5, -- Add padding for cursor
  shiftwidth = 2, -- Number of spaces for each indentation
  showtabline = 2, -- Always show tabs
  signcolumn = 'yes', -- Always show signcolumn to stop jumping when showing info
  smartcase = true, -- Case sensitive search when using capital letters
  smartindent = true, -- Smart indenting
  softtabstop = 2, -- Spaces for indentation
  splitbelow = false, -- Split pane on bottom
  splitright = true, -- Split pane to the right
  swapfile = false, -- creates a swapfile
  tabstop = 2, -- Spaces for indentation
  termguicolors = true, -- Use proper colors in terminal
  updatetime = 300, -- Faster completion
  wrap = true, -- Wrap lines
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
