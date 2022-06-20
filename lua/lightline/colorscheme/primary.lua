local config = require("primary.config")
local colors = require("primary.colors").setup(config)
local util = require("primary.util")

local primary = {}

primary.normal = {
  left = {{ colors.black, colors.blue }, { colors.blue, colors.fg_gutter }},
  middle = {{ colors.fg, colors.bg_statusline }},
  right = {{ colors.black, colors.blue }, { colors.blue, colors.fg_gutter }},
  error = {{ colors.black, colors.error }},
  warning = {{ colors.black, colors.warning }},
}

primary.insert = {
  left = {{ colors.black, colors.green }, { colors.blue, colors.bg }},
}

primary.visual = {
  left = {{ colors.black, colors.magenta }, { colors.blue, colors.bg }},
}

primary.replace = {
  left = {{ colors.black, colors.red }, { colors.blue, colors.bg }},
}

primary.inactive = {
  left = {{ colors.blue, colors.bg_statusline }, {colors.dark3, colors.bg }},
  middle = {{ colors.fg_gutter, colors.bg_statusline }},
  right = {{ colors.fg_gutter, colors.bg_statusline }, {colors.dark3, colors.bg }},
}

primary.tabline = {
  left = {{ colors.dark3, colors.bg_highlight }, {colors.dark3, colors.bg }},
  middle = {{ colors.fg_gutter, colors.bg_statusline }},
  right = {{ colors.fg_gutter, colors.bg_statusline }, {colors.dark3, colors.bg }},
  tabsel = {{ colors.blue, colors.fg_gutter }, { colors.dark3, colors.bg }},
}

if vim.o.background == "light" then
  for _, mode in pairs(primary) do
    for _, section in pairs(mode) do
      for _, subsection in pairs(section) do
        subsection[1] = util.getColor(subsection[1])
        subsection[2] = util.getColor(subsection[2])
      end
    end
  end
end

return primary
