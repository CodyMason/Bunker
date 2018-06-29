
require "resource"

ROOM_TYPES = {[1] = "empty",
              [2] = "storage",
              [3] = "food",
              [4] = "power",
              [5] = "oxygen"}

function Room(type, tx, ty, w, h, speed)
  local r = {}

  -- REPLACE THESE LOCALS WITH GLOBAL CONSTANTS
  function r:getRoomColor()
    local colors = {["empty"]   = {0.5, 0.5, 0.5},
                    ["storage"] = {1.0, 0.5, 0.2},
					["power"]   = {0.75, 0.2, 0.1},
                    ["food"]    = {0.35, 0.9, 0.24},
                    ["oxygen"]  = {0.0, 0.5, 0.8}}
    return colors[self.type]
  end
  
  function r:getRoomSpeed()
	local speeds = {["power"]  = 24,
					["food"]   = 56,
					["oxygen"] = 32}
	return speeds[self.type]
  end

  r.type  = type
  r.tx    = tx
  r.ty    = ty
  r.w     = w
  r.h     = h
  
  r.speed = r:getRoomSpeed() or 0 -- resource collection speed
  r.color = r:getRoomColor() or {1, 0, 0}

  function r:build()
    for y=self.ty, self.ty+self.h-1 do
      for x=self.tx, self.tx+self.w-1 do
        world_map.data[y][x] = Tile(1, x, y)
      end
    end
  end
  
  function r:collectResources()
	if resources[self.type] ~= nil then
	  local amt = (self.w * self.h)/10
	  resources[self.type].value = resources[self.type].value + amt
	end
  end

  function r:update()
	if game_timer % self.speed == 0 then
		self:collectResources()
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
