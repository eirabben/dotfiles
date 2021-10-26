require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.twig = {
  install_info = {
    url = "~/Code/tree-sitter-twig", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "twig",
}
