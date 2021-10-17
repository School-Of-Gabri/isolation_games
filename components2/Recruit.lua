
-- BasicRecruit
local BasicRecruit = {
  name = '',
  cost = 100,
  speed = 10,
  health = 20,
  damage = 1
}

-- Recruit
local Recruit = {}
Recruit.__index = Recruit

-- Constructor
function Recruit.new(name)
  local self = setmetatable({}, Recruit)
  self.name = name
  self.cost = BasicRecruit.cost
  self.speed = BasicRecruit.speed
  self.health = BasicRecruit.health
  self.damage = BasicRecruit.damage

  self.position = {}
  self.position.x = 0
  self.position.y = 0
  return self
end

-- Getters
function Recruit.get_health(self)
    return self.health
end

-- Setters
function Recruit.spawn(self, x, y)
    self.position.x = x
    self.position.y = y
end
function Recruit.take_damage(self, hitpoints)
  self.health = self.health - hitpoints
  if self.health < 0 then
    self.health = 0
  end
  return self.health
end

-- Voids
function Recruit.render(self)
    print(("Rendering Recruit " + self.name))
    self.dump()
end
function Recruit.attack(self, other)
  if getmetatable(other) ~= Recruit then
    error("invalid operation")
  end
  other:take_damage(self.damage)
end
function Recruit.dump(self)
  print('Recruit dump()')
  print(inspect(self))
end

return Recruit