local inspect = require('libs.inspect')
local general = require('libs.general')

-- BasicRecruit
local BasicRecruit = {
  name = '',
  cost = 100,
  speed = 10,
  health = 20,
  damage = 1
}
BasicRecruit.__index = BasicRecruit

-- Recruit
local Recruit = general.class(function(Recruit)
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
    function Recruit.spawn(self, x, y)
        self.position.x = x
        self.position.y = y
    end
    function Recruit.render(self)
        print(("Rendering Recruit " + self.name))
        self.dump()
    end
    function Recruit.health(self)
        return self.health
    end
    function Recruit.dump(self)
      print('Recruit dump()')
      print(inspect(self))
    end
    return Recruit
end, {})

return Recruit

