require "misc"
require "room"
require "menu"

function Builder()
  local b  = {}
  b.x      = 0
  b.y      = 0
  b.tx     = 1
  b.ty     = 1

  b.menu   = BuildMenu(32, 64, 40, 144)

  b.pressed      = false
  b.just_pressed = false

  b.sprites = {
    love.graphics.newImage("images/cursor/mouse.png"),
    love.graphics.newImage("images/cursor/mouse_clicked.png")
  }
  b.sprite = b.sprites[1]

  function b:checkPressed()
    if self.pressed == false then
      if love.mouse.isDown(1) then
        self.pressed      = true
        self.just_pressed = true
      end
    elseif self.pressed == true then
      self.just_pressed = false
      if not(love.mouse.isDown(1)) then
        self.pressed = false
      end
    end
  end

  function b:inBounds()
    return (self.tx >= 1 and self.tx <= world_map.w) and (self.ty >= 1 and self.ty <= world_map.h)
  end

  function b:canBuild()
    local tile = world_map.data[self.ty][self.tx]
    if self:inBounds() then
      if tile == 0 then
        --print("can place")
        return true
      else
        --print("cannot place")
      end
    end
  end

  function b:placeTile(type)
    world_map.data[self.ty][self.tx] = Tile(type, self.tx, self.ty)
  end

  function b:drawRoom() -- Sets room start and end points
    if self.just_pressed then
      self.drawing_room = true
      self.room_start = {self.tx, self.ty}
      --print("room tx: "..tostring(self.room_start[1]))
      --print("room ty: "..tostring(self.room_start[2]))
    end
    self.room_end = {self.tx+1, self.ty+1}
  end

  function b:createRoom(type)
    local rtx = math.min(self.room_start[1], self.room_end[1])
    local rty = math.min(self.room_start[2], self.room_end[2])
    local rw  = math.abs(self.room_end[1] - self.room_start[1])
    local rh  = math.abs(self.room_end[2] - self.room_start[2])

    print("room build rtx: "..tostring(rtx))
    print("room build rty: "..tostring(rty))
    print("room build  rw: "..tostring(rw))
    print("room build  rh: "..tostring(rh))

    if rw > 0 and rh > 0 then
      local room = Room(type, rtx, rty, rw, rh)
      room:build()
      rooms[#rooms+1] = room
    end
  end

  function b:buildMode()
    if self.pressed then
      if self:canBuild() then
        self:drawRoom()
      end
    else
      if self.room_start ~= nil and self.room_end ~= nil  and self.drawing_room == true then
        self.drawing_room = false
        self:createRoom(ROOM_TYPES[math.random(#ROOM_TYPES)])
      end
    end
  end

  function b:update()
    followMouse(self)
    self:checkPressed()
    self.tx = math.floor(self.x/TILE_WIDTH)  + 1
    self.ty = math.floor(self.y/TILE_HEIGHT) + 1

    --self.menu:update()

    self:buildMode()
  end

  function b:drawSelection()
    if self.room_start and self.room_end and self.drawing_room then
      love.graphics.setColor(0, 1, 0.2)
      local rx = (self.room_start[1]-1) * TILE_WIDTH
      local ry = (self.room_start[2]-1) * TILE_HEIGHT
      local rw = (self.room_end[1] - self.room_start[1]) * TILE_WIDTH
      local rh = (self.room_end[2] - self.room_start[2]) * TILE_HEIGHT

      love.graphics.rectangle("line", rx, ry, rw, rh)
      love.graphics.setColor(1, 1, 1)
    end
  end

  function b:debugDraw()
    love.graphics.setColor(1, 0, 0)
    -- Show tx ty box
    love.graphics.rectangle("line", self.tx, self.ty, TILE_WIDTH, TILE_HEIGHT)
    -- Draw circles to show pressed / just_pressed states
    if self.pressed then
      love.graphics.circle("fill", 64, 32, 8)
    end
    if self.just_pressed then
      love.graphics.circle("fill", 88, 32, 8)
    end
    love.graphics.setColor(1, 1, 1)
  end

  function b:draw()
    self.menu:draw()
    self:drawSelection()
    love.graphics.draw(self.sprite, self.x, self.y)

    --self:debugDraw()
  end

  return b
end
