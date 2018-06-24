
function setupGame()
  grid = true

  rooms = {}

  world_map = Map(40, 30)
  world_map:genMap(8)

  builder = Builder()
end

function updateGame()
  builder:update()
end

function drawGame()
  if grid then drawGrid() end
  world_map:draw()

  for i=1, #rooms do
    rooms[i]:draw()
  end

  builder:draw()
end
