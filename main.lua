require "window"
require "game"
require "builder"
require "map"
require "room"

function love.load()
  setupWindow()
  setupGame()
end

function love.update(dt)
  builder:update()
end

function love.draw()
  drawGrid()
  world_map:draw()

  for i=1, #rooms do
    rooms[i]:draw()
  end

  builder:draw()
end

function love.keypressed(key)
  if key == "r" then
    love.load()
  elseif key == "escape" then
    love.event.quit()
  end
end
