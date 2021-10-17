local inspect = require('libs.inspect')
local general = require('libs.general')

--[[
A game mode is the way we distinguish between different
states, such as: menu, settings, in game, paused, etc...
]]--

-- GameMode
local GameMode = general.class(function(GameMode)
    function GameMode.new(name)
        local self = setmetatable({}, GameMode)
        self.name = name
        return self
    end
    function GameMode.dump(self)
      print('GameMode dump()')
      print(inspect(self))
    end
    return GameMode
end, {})

return GameMode