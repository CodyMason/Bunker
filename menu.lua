require "misc"

function MenuItem(menu, img, x, y)
  local m = {}
  m.menu 	= menu
  m.img     = img
  m.x       = x -- x relative to menu x
  m.y       = y -- y relative to menu y
  m.sz      = 16
  m.hovered = false

  function m:checkHovered()
	local ox = self.menu.x
	local oy = self.menu.y
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	
	if dist(self.x+ox+(self.sz/2), self.y+oy+(self.sz/2), x, y-8) < self.sz then
	  return true
	else
	  return false
	end
  end
  
  function m:update()
    self.hovered = self:checkHovered()
  end

  function m:draw()
	local ox = self.menu.x
	local oy = self.menu.y
	
	if self.hovered then
	  love.graphics.setColor(1, 1, 1)
	  love.graphics.circle("fill", self.x+ox+(self.sz/2 + 4), self.y+oy+(self.sz/2 + 4), self.sz)
	end
	
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
             MenuItem(m, love.graphics.newImage("images/build_menu/plant.png"), 8, 16),
             MenuItem(m, love.graphics.newImage("images/build_menu/power.png"), 8, 48),
             MenuItem(m, love.graphics.newImage("images/build_menu/oxygen.png"), 8, 80),
             MenuItem(m, love.graphics.newImage("images/build_menu/storage.png"), 8, 112)
  }}

  function m:update()
	for i=1, #self.items[self.open_tab] do
	  self.items[self.open_tab][i]:update()
	end
  end
  
  function m:draw()
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, 16, 16, 16)
    love.graphics.setColor(1, 1, 1)

    for i=1, #self.items[self.open_tab] do
      self.items[self.open_tab][i]:draw(self.x, self.y)
    end
  end

  return m
end
