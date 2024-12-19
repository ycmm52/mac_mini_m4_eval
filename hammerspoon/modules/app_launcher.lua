-- ~/.hammerspoon/modules/app-launcher.lua
local module = {}

-- App Launcher Configuration
local appShortcuts = {
    -- Format: key = app name
    c = "Google Chrome",
    i = "IINA",
    f = "Finder",
    k = "kitty",
    v = "Visual Studio Code",
}

function module.setupAppLauncher()
    for key, app in pairs(appShortcuts) do
        hs.hotkey.bind({"ctrl", "cmd"}, key, function()
            hs.application.launchOrFocus(app)
            -- Optional: Show alert when app is launched
            hs.alert.show("Launching " .. app)
        end)
    end
end

module.setupAppLauncher()
return module
