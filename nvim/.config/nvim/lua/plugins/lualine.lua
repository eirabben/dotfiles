require('lualine').setup({
  options = {
    theme = 'rose-pine',
    component_separators = { left = '>', right = '<'},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = { 'NvimTree' },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

-- Slant glyphs
-- let s:seperator.homemoderight = ''
-- let s:seperator.filenameright = ''
-- let s:seperator.filesizeright = ''
-- let s:seperator.gitleft = ''
-- let s:seperator.gitright = ''
-- let s:seperator.lineinfoleft = ''
-- let s:seperator.lineformatright = ''
-- let s:seperator.EndSeperate = ' '
-- let s:seperator.emptySeperate1 = ''
-- let s:seperator.homemoderight = ''
-- let s:seperator.filenameright = ''
-- let s:seperator.filesizeright = ''
-- let s:seperator.gitleft = ''
-- let s:seperator.gitright = ''
-- let s:seperator.lineinfoleft = ''
-- let s:seperator.lineformatright = ''
-- let s:seperator.EndSeperate = ' '
-- let s:seperator.emptySeperate1 = ''
