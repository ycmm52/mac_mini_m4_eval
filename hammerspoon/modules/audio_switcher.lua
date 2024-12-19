-- ~/.hammerspoon/modules/audio_switcher.lua

-- Initialize required modules
local hotkey = require("hs.hotkey")
local chooser = require("hs.chooser")
local audiodevice = require("hs.audiodevice")
local menubar = require("hs.menubar")
local image = require("hs.image")
local alert = require("hs.alert")

-- Create module table
local audioSwitcher = {
    chooser = nil,
    menubarItem = nil,
    watcher = nil
}

-- Create audio device chooser
function audioSwitcher.createChooserItems()
    local devices = audiodevice.allOutputDevices()
    local currentDevice = audiodevice.defaultOutputDevice()
    local choices = {}
    
    for _, device in ipairs(devices) do
        local volume = device:volume() or 0
        local choice = {
            text = device:name(),
            subText = "Volume: " .. math.floor(volume) .. "%",
            deviceObj = device
        }
        
        if currentDevice and device:uid() == currentDevice:uid() then
            choice.image = image.imageFromName("NSStatusAvailable")
        end
        
        table.insert(choices, choice)
    end
    
    return choices
end

-- Update menu bar display
function audioSwitcher.updateMenuDisplay()
    if audioSwitcher.menubarItem then
        local current = audiodevice.defaultOutputDevice()
        if current then
            local volume = math.floor(current:volume() or 0)
            local name = current:name() or "Unknown"
            name = name:sub(1, 10)  -- Truncate long names
            audioSwitcher.menubarItem:setTitle("🔊 " .. name .. " (" .. volume .. "%)")
        end
    end
end

-- Show chooser window
function audioSwitcher.showChooser()
    if not audioSwitcher.chooser then
        audioSwitcher.chooser = chooser.new(function(choice)
            if choice then
                choice.deviceObj:setDefaultOutputDevice()
                alert.show("Switched to: " .. choice.text)
                audioSwitcher.updateMenuDisplay()
            end
        end)
    end
    
    audioSwitcher.chooser:choices(audioSwitcher.createChooserItems())
    audioSwitcher.chooser:placeholderText("Select Audio Output Device")
    audioSwitcher.chooser:show()
end

-- Initialize the module
function audioSwitcher.init()
    -- Create menu bar item
    audioSwitcher.menubarItem = menubar.new()
    
    -- Set up menu bar if created successfully
    if audioSwitcher.menubarItem then
        audioSwitcher.updateMenuDisplay()
        audioSwitcher.menubarItem:setClickCallback(function()
            audioSwitcher.showChooser()
        end)
    end
    
    -- Set up hotkey
    hotkey.bind({"cmd", "alt"}, "a", function()
        audioSwitcher.showChooser()
    end)
    
    -- Set up volume/device watcher using audiodevice.watcher
    audioSwitcher.watcher = audiodevice.watcher.new(audioSwitcher.updateMenuDisplay)
    if audioSwitcher.watcher then
        audioSwitcher.watcher:start()
    end
end

-- Cleanup function
function audioSwitcher.cleanup()
    if audioSwitcher.watcher then
        audioSwitcher.watcher:stop()
        audioSwitcher.watcher = nil
    end
    
    if audioSwitcher.chooser then
        audioSwitcher.chooser:delete()
        audioSwitcher.chooser = nil
    end
    
    if audioSwitcher.menubarItem then
        audioSwitcher.menubarItem:delete()
        audioSwitcher.menubarItem = nil
    end
end

-- Initialize the module
audioSwitcher.init()

return audioSwitcher
