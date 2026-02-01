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
      url = plugin_dir .. "/repo",
      files = { "src/parser.c" },
      branch = "main"
    },
  }
end

vim.filetype.add(
  {
    extension = {
      conf = function (path, bufnr)
        local function is_kitty_conf(bufnr, max)
          bufnr = bufnr or 0
          max = max or 20

          local lines = vim.api.nvim_buf_get_lines(bufnr, 0, max, false)
          for _, line in ipairs(lines) do
            if line:match("%S") then
              return line:match("^%s*#kitty%.conf%s*$") ~= nil
            end
          end

          return false
        end
        if is_kitty_conf(bufnr) then
          return "kitty"
        end
      end
    },
    filename = {
      ["kitty.conf"] = "kitty"
    } 
  }
)
