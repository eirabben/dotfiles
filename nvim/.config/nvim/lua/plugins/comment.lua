vim.api.nvim_command('autocmd FileType twig set commentstring={#\\ %s\\ #}')

require('Comment').setup()