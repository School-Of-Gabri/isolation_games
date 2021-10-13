local inspect = require('libs.inspect')
local general = require('libs.general')
local GameMode = require('components.GameMode')

-- BasicGame
--[[
A simple structure that will serve as a 
starter template for our isolation (mini)games
]]--
BasicGame = {
  mode = nil,
  player1 = nil,
  player2 = nil,
  levels = {},
  mode = nil
}

BasicGame.game_modes = {
  starting = GameMode.new('Starting'),
  menu = GameMode.new('Menu'),
  loading = GameMode.new('Loading'),
  cinematic = GameMode.new('Cinematic'),
  adventure = GameMode.new('Adventure'),
  royal = GameMode.new('Royal'),
  waves = GameMode.new('Waves'),
  test = GameMode.new('Test'),
  credits = GameMode.new('Credits'),
  quit = GameMode.new('Quit'),
  settings = GameMode.new('Settings')
}
BasicGame.__index = BasicGame


-- Game
local Game = general.class(function(Game)
    function Game.new(self, name)
        self.name = name
        self.mode = BasicGame.game_modes.starting

        self.position = {}
        self.position.x = 0
        self.position.y = 0
    end
    function Game.spawn(self, x, y)
        self.x = x
        self.y = y
    end
    function Game.render(self, display)
        print('BasicGame render(): ' .. self.name)
        self.dump()
        maps.draw_meshed_grid(self.levels.funny_grid)
        ui.render(display.menu)
    end
    function Game.dump(self)
      print('Game dump()')
      print(inspect(self))
    end
    return Game
end, {})

return Game