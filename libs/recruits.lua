local utils = require('libs.utils')
local inspect = require('libs.inspect')

BasicRecruit = {
  cost = 0,
  speed = 0,
  health = 0,
  position = {0, 0}
}

Recruit = {}

function Recruit.new(self)
  local newRec = BasicRecruit
  newRec.cost = 100
  newRec.speed = 10
  newRec.health = 100
  
  self.__index = self
  return setmetatable(newRec, self)
end

function Recruit.spawn(self, x_pos, y_pos)
  self.position = {x_pos, y_pos}
end

function Recruit.move(self, direction, distance)
  self.position = utils.calculate_x_and_y_components(direction, distance)
end

function Recruit.dump(self)
  print('Recruit.dump()')
  print(inspect(self))
end

return {
  Recruit = Recruit
}


--[[
Recruit = class(function(rec, cost, speed, health)
            rec.cost = cost
            rec.speed = speed
            rec.health = health
            rec.x = nil
            rec.y = nil
          end)




recruits.Recruit = Recruit
]]--

--[[
Infantry = class(Recruit, function(inf, damage)
              Recruit.init(inf, 100, 10, 100)
              inf.damage = damage
            end)

function Infantry:dump()
  print("Infantry:dump()")
  print(inspect(self))
end

recruits.Infantry = Infantry
]]--