
function MenuItem(img, x, y)
  local m = {}
  m.img = img
  m.x   = x -- x relative to menu x
  m.y   = y -- y relative to menu y

  function m:update()
    -- stuff goes here
  end

  function m:draw(ox, oy)
    love.graphics.draw(self.img, self.x+ox, self.y+oy)
  end

  return m
end

function BuildMenu(x, y, w, h)
  local m = {}
  m.x        = x
  m.y        = y
  m.w        = w
  m.h        = h
  m.tabs  = {"Rooms"}
  m.open_tab = "Rooms"
  m.items = {["Rooms"] = {
             MenuItem(love.graphics.newImage("images/build_menu/plant.png"), 8, 16),
             MenuItem(love.graphics.newImage("images/build_menu/power.png"), 8, 48),
             MenuItem(love.graphics.newImage("images/build_menu/oxygen.png"), 8, 80),
             MenuItem(love.graphics.newImage("images/build_menu/storage.png"), 8, 112)
  }}

  function m:draw()
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, 16, 16, 8)
    love.graphics.setColor(1, 1, 1)

    for i=1, #self.items[self.open_tab] do
      self.items[self.open_tab][i]:draw(self.x, self.y)
    end
  end

  return m
end
