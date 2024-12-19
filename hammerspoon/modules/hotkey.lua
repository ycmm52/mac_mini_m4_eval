local hotkey = require("hs.hotkey")

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

