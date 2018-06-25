
function followMouse(self)
  self.x, self.y = love.mouse.getPosition()
end

function drawGrid()
  love.graphics.setColor(0.9, 0.9, 0.9)
  for y=1, world_map.h do
    love.graphics.line(0, y*TILE_HEIGHT, world_map.w*TILE_WIDTH, y*TILE_WIDTH)
  end
  for x=1, world_map.w do
    love.graphics.line(x*TILE_WIDTH, 0, x*TILE_WIDTH, world_map.h*TILE_HEIGHT)
  end
  love.graphics.setColor(1, 1, 1)
end

function dist(x1, y1, x2, y2)
  return math.sqrt((x1-x2)^2 + (y1-y2)^2)
end