
ROOM_TYPES = {[1] = "empty",
              [2] = "storage",
              [3] = "plant",
              [4] = "power",
              [5] = "oxygen"}

function Room(type, tx, ty, w, h)
  local r = {}

  function r:getRoomColor()
    local colors = {["empty"]   = {0.5, 0.5, 0.5},
                    ["storage"] = {1.0, 0.5, 0.2},
                    ["plant"]   = {0.35, 0.9, 0.24},
                    ["power"]   = {0.75, 0.2, 0.1},
                    ["oxygen"]  = {0.0, 0.5, 0.8}}
    return colors[self.type]
  end

  r.type  = type
  r.tx    = tx
  r.ty    = ty
  r.w     = w
  r.h     = h
  r.color = r:getRoomColor()

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
    love.graphics.rectangle("fill", ((self.tx-1)*TILE_WIDTH)+inset-2, ((self.ty-1)*TILE_HEIGHT)+inset-2, 14-2, 14-2)
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.rectangle("fill", ((self.tx-1)*TILE_WIDTH)+inset, ((self.ty-1)*TILE_HEIGHT)+inset, 14-inset-2, 14-inset-2)
    love.graphics.setColor(1, 1, 1)
  end

  return r
end
