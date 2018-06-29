require "window"
require "game"
require "builder"
require "map"
require "room"
require "ui"

function love.load()
  setupWindow()
  setupGame()
end

function love.update(dt)
  updateGame()
end

function love.draw()
  drawGame()
end

function love.keypressed(key)
  if key == "r" then
    love.load()
  elseif key == "escape" then
    love.event.quit()
  elseif key == "g" then
    grid = not grid
  end
end
