
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
	local c = COLORS[self.type]
	local v = 0.25
    return {v+(c[1]*0.8), v+(c[2]*0.8), v+(c[3]*0.8)}
  end
  
  function r:getRoomSpeed()
	local speeds = {["power"]  = 24,
					["food"]   = 56,
					["oxygen"] = 32}
	return speeds[self.type]
  end

  -- INITIATE VARIABLES
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
	
	love.graphics.setColor(self.color)
	love.graphics.rectangle("fill", (self.tx-1)*TILE_WIDTH, (self.ty-1)*TILE_HEIGHT, self.w*TILE_WIDTH, self.h*TILE_HEIGHT)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", ((self.tx-1)*TILE_WIDTH)+inset, ((self.ty-1)*TILE_HEIGHT)+inset,
                                    (self.w*TILE_WIDTH)-inset*2,  (self.h*TILE_HEIGHT)-inset*2)
    --love.graphics.setColor(1, 1, 1)
    --love.graphics.rectangle("fill", ((self.tx-1)*TILE_WIDTH)+inset-2, ((self.ty-1)*TILE_HEIGHT)+inset-2, 14-2, 14-2)
    --love.graphics.setColor(COLORS[self.type])
    --love.graphics.rectangle("fill", ((self.tx-1)*TILE_WIDTH)+inset, ((self.ty-1)*TILE_HEIGHT)+inset, 14-inset-2, 14-inset-2)
    love.graphics.setColor(1, 1, 1)
  end

  return r
end
