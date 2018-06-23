
TILE_WIDTH = 16
TILE_HEIGHT = 16

function Tile(type, tx, ty)
  local t = {}
  t.type = type
  t.tx  = tx
  t.ty  = ty

  function t:draw()
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", (self.tx-1)*TILE_WIDTH, (self.ty-1)*TILE_HEIGHT, TILE_WIDTH, TILE_HEIGHT)
    love.graphics.setColor(1, 1, 1)
  end

  return t
end
