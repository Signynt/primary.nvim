local util = require("primary.util")
local theme = require("primary.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
