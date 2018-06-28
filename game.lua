require "resource"

function setupGame()
  grid = true
  rooms = {}

  initResources()
  initUI()

  initMap()

  builder = Builder()
end

function updateGame()
  builder:update()
  updateResources()
  updateUI()
end

function drawGame()
  if grid then drawGrid() end
  world_map:draw()

  for i=1, #rooms do
    rooms[i]:draw()
  end

  drawUI()
  builder:draw()
end
