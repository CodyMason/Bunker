
RESOURCE_TYPES = {"power", "food", "oxygen"}

function Resource(type, value, max)
  local r = {}
  r.type  = type
  r.value = value
  r.max   = max

  function r:limitResource()
    if self.value >= self.max then
      self.value = self.max
    end
  end

  function r:update()
    self:limitResource()
	self.value = self.value % self.max
  end

  return r
end

function initResources()
  resources = {["power"]  = Resource("power",  0, 50),
               ["food"]   = Resource("food",   0, 75),
               ["oxygen"] = Resource("oxygen", 0, 25)}
  --print(resources["power"])
end

function updateResources()
  for i=1, #RESOURCE_TYPES do
    local index = RESOURCE_TYPES[i]
    resources[index]:update()
  end
end
