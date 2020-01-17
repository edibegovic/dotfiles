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
  w = 'Wire',
  a = 'Finder',
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

hs.hotkey.bind(hyper, "return", function()
  hs.application.launchOrFocus('Evernote')
  hs.eventtap.keyStroke("cmd", "j")
end)

