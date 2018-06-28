
function setupWindow()
  love.window.setMode(640, 480, {msaa = 4})
  love.window.setTitle("Bunker")
  love.graphics.setBackgroundColor(1,1,1)
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.mouse.setVisible(false)
end
