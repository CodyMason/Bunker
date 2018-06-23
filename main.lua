require "window"
require "builder"
require "map"

function love.load()
  setupWindow()

  rooms = {}

  world_map = Map(40, 30)
  world_map:genMap(8)

  builder = Builder()
end

function love.update(dt)
  builder:update()
end

function love.draw()
  drawGrid()
  world_map:draw()
  builder:draw()
end

function love.keypressed(key)
  if key == "r" then
    love.load()
  elseif key == "escape" then
    love.event.quit()
  end
end
