local util = require("primary.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("primary.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    none = "NONE",
    bg_dark = "#EBE2D5",
    bg = "#F7F3EE",
    bg_highlight = "#E4D7C4", --text-selection (active line)
    terminal_black = "#414868", --?
    fg = "#4A341C", --text-normal
    fg_dark = "#4A341C", --text-normal (text in bottom bar)
    fg_gutter = "#CFB696", --text-faint (guttern and left arrow in bottom bar)
    dark3 = "#545c7e", --?
    comment = "#CFB696", --text-faint
    dark5 = "#9D8062", --color-l-gray-70 (gutter current line)
    blue0 = "#E4D7C4", --text-selection
    blue = "#2882C3", --color-l-blue-500 (highlighted tab and `function`)
    cyan = "#7dcfff", --?
    blue1 = "#63A0BB", --color-l-blue-300 (curly brackets)
    blue2 = "#2882C3", --color-l-blue-500
    blue5 = "#2882C3", --color-l-blue-500
    blue6 = "#256EA2", --color-l-blue-700
    blue7 = "#034A7C", --color-l-blue-900
    magenta = "#8D6FB3", --color-l-violet-500 (`require`, `local`)
    magenta2 = "#451782", --color-l-violet-900
    purple = "#8D6FB3", --color-l-violet-500
    orange = "#EA702E", --color-l-orange-500
    yellow = "#E4AE25", --color-l-yellow-500
    green = "#42B885", --color-l-green-500
    green1 = "#72DAAD", --color-l-green-300
    green2 = "#2F9369", --color-l-green-700
    teal = "#1B7961", --color-l-green-900
    red = "#DF453A", --color-l-red-500
    red1 = "#7F211A", --color-l-red-900
    git = { change = "#2882C3", add = "#42B885", delete = "#DF453A", conflict = "#DF453A" },
    gitSigns = { add = "#2F9369", change = "#256EA2", delete = "#DF453A" },
  }
  if config.style == "night" or config.style == "day" or vim.o.background == "light" then
    colors.bg = "#F7F3EE" --background-primary
    colors.bg_dark = "#EBE2D5" --color-l-gray-30 (bottom bar)
  end
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.diff = {
    add = util.darken(colors.green2, 0.15),
    delete = util.darken(colors.red1, 0.15),
    change = util.darken(colors.blue7, 0.15),
    text = colors.blue7,
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 1, "#000000")
  colors.border_highlight = colors.blue0
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = (config.transparentSidebar and colors.none) or config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

  colors.bg_visual = util.darken(colors.blue0, 0.3)
  colors.bg_search = colors.blue0
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red1
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal

  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M
