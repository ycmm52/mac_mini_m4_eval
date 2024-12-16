-- Initialize the hotkey module
local hotkey = require("hs.hotkey")
local window = require("hs.window")
local application = require("hs.application")

-- Set animation duration (set to 0 for instant transitions)
window.animationDuration = 0.1

-- Window Management Functions
function windowManagement(direction)
    local win = window.focusedWindow()
    if not win then return end
    
    local screen = win:screen()
    local frame = screen:frame()
    local winFrame = win:frame()
    
    if direction == "up" then
        -- Expand to full screen
        winFrame.x = frame.x
        winFrame.y = frame.y
        winFrame.w = frame.w
        winFrame.h = frame.h
    elseif direction == "left" then
        -- Left half of screen
        winFrame.x = frame.x
        winFrame.y = frame.y
        winFrame.w = frame.w / 2
        winFrame.h = frame.h
    elseif direction == "right" then
        -- Right half of screen
        winFrame.x = frame.x + frame.w / 2
        winFrame.y = frame.y
        winFrame.w = frame.w / 2
        winFrame.h = frame.h
    elseif direction == "down" then
        -- Center and shrink
        winFrame.w = frame.w * 0.7
        winFrame.h = frame.h * 0.7
        winFrame.x = frame.x + (frame.w - winFrame.w) / 2
        winFrame.y = frame.y + (frame.h - winFrame.h) / 2
    end
    
    win:setFrame(winFrame)
end

-- Bind window management hotkeys
-- Ctrl + Cmd + Arrow keys
hotkey.bind({"ctrl", "cmd"}, "up", function() windowManagement("up") end)
hotkey.bind({"ctrl", "cmd"}, "left", function() windowManagement("left") end)
hotkey.bind({"ctrl", "cmd"}, "right", function() windowManagement("right") end)
hotkey.bind({"ctrl", "cmd"}, "down", function() windowManagement("down") end)

-- App Launcher Configuration
local appShortcuts = {
    -- Format: key = app name
    -- Feel free to modify these shortcuts based on your needs
    c = "Google Chrome",
    f = "Finder",
    k = "kitty",
    v = "Visual Studio Code",
}

-- Create app launcher hotkeys (Ctrl + Cmd + key)
for key, app in pairs(appShortcuts) do
    hotkey.bind({"ctrl", "cmd"}, key, function()
        application.launchOrFocus(app)
        -- Optional: Show alert when app is launched
        hs.alert.show("Launching " .. app)
    end)
end

-- Reload config
hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
    hs.reload()
    hs.alert.show("Config reloaded!")
end)

-- Optional: Show alert when config is loaded
hs.alert.show("Hammerspoon config loaded")

-- Function to open websites
function openGitHub()
    hs.urlevent.openURL("https://www.github.com/trending")
end

function openReddit()
    hs.urlevent.openURL("https://www.reddit.com")
end

function openBilibili()
    hs.urlevent.openURL("https://www.bilibili.com")
end

-- 'C' represents Control
-- 'cmd' represents Command
hotkey.bind({"ctrl", "cmd"}, "b", openBilibili)
hotkey.bind({"ctrl", "cmd"}, "g", openGitHub)
hotkey.bind({"ctrl", "cmd"}, "r", openReddit)

