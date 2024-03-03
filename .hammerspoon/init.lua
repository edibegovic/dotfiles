local application = require 'hs.application'
local window = require 'hs.window'

local hyper = { "cmd", "alt", "ctrl", "shift" }

-- Reload config with HYOER+0
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

-- Automatically reload this config when it's save with changes
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()

-- Notify when Hammerspoon is reloaded
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

hs.window.animationDuration = 0

local applicationHotkeys = {
  c = 'Google Chrome',
  -- c = 'Firefox',
  s = 'Spotify',
  e = 'Bear',
  -- g = 'GSE SMART IPTV',
  g = 'GitKraken',
  t = 'iTerm2',
  w = 'Messenger',
  a = 'Finder',
  v = 'Code',
  p = 'Preview',
  z = 'zoom.us',
  q = 'Signal',
  r = 'Safari',
}

function bindAAppHotkey(key, appName)
  hs.hotkey.bind(hyper, key, function()
    local currentApp = window.frontmostWindow():application()
    if currentApp:name() == appName then
      currentApp:hide()
    else
      hs.application.launchOrFocus(appName)
    end
  end)
end

for key, appName in pairs(applicationHotkeys) do
  bindAAppHotkey(key, appName)
end

hs.hotkey.bind(hyper, "+", function()
  bindAAppHotkey('q', window.frontmostWindow():application():name())
end)
