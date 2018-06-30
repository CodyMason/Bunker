
require "constant"

function UIImage(img, x, y)
  local u  = {}
  u.img    = img
  u.x      = x
  u.y      = y

  function u:update()

  end

  function u:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(self.img, self.x, self.y)
  end

  return u
end

function UIBar(x, y, resource_type, col)
  local b = {}
  b.x     = x
  b.y     = y
  b.type  = resource_type
  b.col   = col
  b.value = 0
  b.max   = 0

  function b:update()
    self.value = resources[self.type].value
    self.max   = resources[self.type].max
  end

  function b:draw()
    -- love.graphics.setColor(0.8, 0.8, 0.8)
    -- love.graphics.rectangle("fill", self.x, self.y, self.max, 4)
    love.graphics.setColor(self.col)
    love.graphics.rectangle("fill", self.x, self.y, self.value, 4)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", self.x+self.max, self.y, 2, 4)
    love.graphics.setColor(1, 1, 1)
  end

  return b
end

function initUI()
  power_bar  = UIBar(64, 18, "power",  COLORS["power"])
  food_bar   = UIBar(64, 34, "food",   COLORS["food"])
  oxygen_bar = UIBar(64, 50, "oxygen", COLORS["oxygen"])

  ui_elements = {
	UIImage(love.graphics.newImage("images/ui/main/power.png"), 16, 16),
  UIImage(love.graphics.newImage("images/ui/main/food.png"), 16, 32),
  UIImage(love.graphics.newImage("images/ui/main/oxygen.png"), 16, 48),
  power_bar, food_bar, oxygen_bar
  }
end

function updateUI()
  for i=1, #ui_elements do
	ui_elements[i]:update()
  end
end

function drawUI()
  for i=1, #ui_elements do
	ui_elements[i]:draw()
  end
  builder:drawRoomType()
end
