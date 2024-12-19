-- ~/.hammerspoon/modules/caffeine.lua

-- Required modules
local menubar = require("hs.menubar")
local caffeinate = require("hs.caffeinate")
local alert = require("hs.alert")

-- Create module table
local caffeine = {
    menuBarItem = nil,
    isActive = false
}

-- Initialize menu bar item
function caffeine.init()
    caffeine.menuBarItem = menubar.new()
    
    if caffeine.menuBarItem then
        -- Set initial state
        caffeine.isActive = caffeinate.get("displayIdle")
        caffeine.updateDisplay()
        
        -- Set click callback
        caffeine.menuBarItem:setClickCallback(function()
            caffeine.toggle()
        end)
        
        -- Add tooltip
        caffeine.menuBarItem:setTooltip("Caffeine")
    else
        alert.show("Failed to create Caffeine menu bar item")
    end
end

-- Update menu bar display
function caffeine.updateDisplay()
    if caffeine.menuBarItem then
        if caffeine.isActive then
            caffeine.menuBarItem:setTitle("☕️")
            caffeine.menuBarItem:setTooltip("Caffeine: Active (Click to deactivate)")
        else
            caffeine.menuBarItem:setTitle("💤")
            caffeine.menuBarItem:setTooltip("Caffeine: Inactive (Click to activate)")
        end
    end
end

-- Toggle Caffeine state
function caffeine.toggle()
    -- Toggle the state
    caffeine.isActive = not caffeine.isActive
    
    -- Apply the new state
    if caffeine.isActive then
        caffeinate.set("displayIdle", true, false)
        alert.show("Caffeine enabled", 1)
    else
        caffeinate.set("displayIdle", false, false)
        alert.show("Caffeine disabled", 1)
    end
    
    -- Update the display
    caffeine.updateDisplay()
end

-- Clean up function (optional, for when unloading)
function caffeine.cleanup()
    if caffeine.menuBarItem then
        caffeine.menuBarItem:delete()
        caffeine.menuBarItem = nil
    end
    -- Ensure we disable caffeinate when cleaning up
    if caffeine.isActive then
        caffeinate.set("displayIdle", false, false)
    end
end

-- Initialize the module
caffeine.init()

return caffeine
