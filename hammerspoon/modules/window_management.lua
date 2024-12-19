-- ~/.hammerspoon/modules/window-management.lua
local settings = require("config.settings")
local module = {}
local hotkey = require("hs.hotkey")
local window = require("hs.window")

-- Window Management Functions
function module.windowManagement(direction)
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
hotkey.bind({"ctrl", "cmd"}, "up", function() module.windowManagement("up") end)
hotkey.bind({"ctrl", "cmd"}, "left", function() module.windowManagement("left") end)
hotkey.bind({"ctrl", "cmd"}, "right", function() module.windowManagement("right") end)
hotkey.bind({"ctrl", "cmd"}, "down", function() module.windowManagement("down") end)

return module
