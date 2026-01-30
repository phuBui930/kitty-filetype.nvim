local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

local plugin_dir = vim.fn.fnamemodify(
  debug.getinfo(1, "S").source:sub(2),
  ":p:h:h"
)

parser_config.kitty = {
  install_info = {
    url = plugin_dir .. "/repo",
    files = { "src/parser.c" },
    branch = "main"
  },
}
