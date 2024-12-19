-- ~/.hammerspoon/init.lua
require("config.settings")  -- General settings
require("modules.hotkey")
require("modules.window_management")
-- require("modules.audio_switcher")
require("modules.app_launcher")
require("modules.caffeine")

-- Initialize the hotkey module
local hotkey = require("hs.hotkey")

-- Reload config
hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
    hs.reload()
    hs.alert.show("Config reloaded!")
end)

-- Optional: Show alert when config is loaded
hs.alert.show("Hammerspoon config loaded")
