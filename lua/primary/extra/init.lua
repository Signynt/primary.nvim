package.path = "./lua/?/init.lua;./lua/?.lua"

local config = require("primary.config")

local function write(str, fileName)
	print("[write] extra/" .. fileName)
	local file = io.open("extras/" .. fileName, "w")
	file:write(str)
	file:close()
end

-- map of plugin name to plugin extension
local extras = {
	kitty = "conf",
	fish = "fish",
	alacritty = "yml",
	wezterm = "toml",
	tmux = "tmux",
	xresources = "Xresources",
	xfceterm = "theme",
}
-- map of style to style name
local styles = { 
    storm = " Storm",
    night = "",
    day = " Day", 
}

for extra, ext in pairs(extras) do
	local plugin = require("primary.extra." .. extra)
	for style, style_name in pairs(styles) do
		config.style = style
		config = config or require("primary.config")
		config.transform_colors = true
		local colors = require("primary.colors").setup(config)
        local fname = extra .. "_primary_" .. style .. "." .. ext
        colors["_upstream_url"] = "https://github.com/folke/primary.nvim/raw/main/extras/" .. fname
        colors["_style_name"] = "Tokyo Night" .. style_name
		write(plugin.generate(colors), fname)
	end
end
