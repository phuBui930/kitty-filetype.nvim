local has_TS_parser , TS_parser = pcall(require, "nvim-treesitter.parsers")
-- local parser_config = pcall(require("nvim-treesitter.parsers").get_parser_configs())
if has_TS_parser then
  local parser_config = TS_parser.get_parser_configs()

  local plugin_dir = vim.fn.fnamemodify(
    debug.getinfo(1, "S").source:sub(2),
    ":p:h:h"
  )

  parser_config.kitty = {
    install_info = {
      url = "https://github.com/OXY2DEV/tree-sitter-kitty",
      files = { "src/parser.c" },
      branch = "main"
    },
  }
end
