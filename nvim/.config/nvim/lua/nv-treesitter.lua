local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.twig = {
  install_info = {
    url = "~/Code/tree-sitter-twig", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "twig", -- if filetype does not agrees with parser name
  -- used_by = {"bar", "baz"} -- additional filetypes that use this parser
}
