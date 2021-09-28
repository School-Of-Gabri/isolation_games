local inspect = require('libs.inspect')

BasicBuilding = {
  cost = 0,
  health = 0,
  position = {0, 0}
}

Building = {}

function Building.new(self)
  local newBld = BasicBuilding
  newBld.cost = 300
  newBld.health = 500

  self.__index = self
  return setmetatable(newBld, self)
end

function Building.deploy(self, x_pos, y_pos)
  self.position = {x_pos, y_pos}
end

function Building.sell(self, cost)
  self.health = 0
end


function Building.dump(self)
  print('Building.dump()')
  print(inspect(self))
end


return {
  Building = Building
}