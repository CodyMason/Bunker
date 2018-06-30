require "tile"

function Map(w, h)
  local m = {}
  m.w     = w
  m.h     = h
  m.data  = {}

  function m:genEmptyMap()
    self.data = {}
    for y=1, self.h do
      self.data[y] = {}
      for x=1, self.w do
        self.data[y][x] = 0
      end
    end
  end

  function m:draw()
    for y=1, self.h do
      for x=1, self.w do
        if self.data[y][x] ~= nil and self.data[y][x] ~= 0 then
          self.data[y][x]:draw()
        end
      end
    end
  end

  return m
end

function initMap()
  world_map = Map(40, 30)
  world_map:genEmptyMap()
end

function drawGround()
	local width  = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	
	love.graphics.setColor(0.6, 0.6, 0.6)
	love.graphics.rectangle("fill", 0, height-GROUND, width, GROUND)
	love.graphics.setColor(1, 1, 1)
end