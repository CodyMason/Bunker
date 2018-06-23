require "tile"

function Map(w, h)
  local m = {}
  m.w     = w
  m.h     = h
  m.data  = {}

  function m:genMap(floor)
    self.data = {}
    for y=1, self.h do
      self.data[y] = {}
      for x=1, self.w do
        if y >= self.h - floor then
          self.data[y][x] = Tile(1, x, y)
        else
          self.data[y][x] = 0
        end
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
