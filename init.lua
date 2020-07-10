local application = require 'hs.application'
local window = require 'hs.window'

local hyper = { "cmd", "alt", "ctrl", "shift" }

hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

hs.window.animationDuration = 0

local applicationHotkeys = {
  c = 'Google Chrome',
  s = 'Spotify',
  e = 'Evernote',
  g = 'GitKraken',
  i = 'iTerm2',
  t = 'iTerm2',
  w = 'Wire',
  a = 'Finder',
  v = 'Code',
  p = 'Preview',
  q = 'NaN'
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

hs.hotkey.bind(hyper, "return", function()
  hs.application.launchOrFocus('Evernote')
  hs.eventtap.keyStroke("cmd", "j")
end)