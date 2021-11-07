-- vim.api.nvim_command('autocmd FileType twig set commentstring={#%s#}')

require('Comment').setup({
  ignore = '^$',
})

local ft = require('Comment.ft')

ft.set('twig', {'{#%s#}', '{#%s#}'})
