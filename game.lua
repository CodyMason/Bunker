
function setupGame()
  game_timer = 0
  grid = true
  rooms = {}

  initResources()
  initUI()

  initMap()

  builder = Builder()
  worker  = Worker(128, love.graphics.getHeight()-GROUND-16, "none")
end

function updateGame()
  for i=1, #rooms do
    rooms[i]:update()
  end

  builder:update()
  updateResources()
  updateUI()
  
  game_timer = game_timer + 1
end

function drawGame()
  if grid then drawGrid() end
  --world_map:draw()
  drawGround()

  for i=1, #rooms do
    rooms[i]:draw()
  end
  
  worker:draw()

  drawUI()
  builder:draw()
end
