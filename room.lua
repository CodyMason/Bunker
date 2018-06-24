
function Room(type, tx, ty, w, h)
  local r = {}
  r.type = type
  r.tx   = tx
  r.ty   = ty
  r.w    = w
  r.h    = h

  function r:build()
    for y=self.ty, self.ty+self.h-1 do
      for x=self.tx, self.tx+self.w-1 do
        world_map.data[y][x] = Tile(1, x, y)
      end
    end
  end

  function r:draw()
    local inset = 4
    love.graphics.setColor(0.6, 0.6, 0.6)
    love.graphics.rectangle("line", ((self.tx-1)*TILE_WIDTH)+inset, ((self.ty-1)*TILE_HEIGHT)+inset,
                                    (self.w*TILE_WIDTH)-inset*2,  (self.h*TILE_HEIGHT)-inset*2)
    love.graphics.setColor(1, 1, 1)
  end

  return r
end
