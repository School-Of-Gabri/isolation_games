local recruits = require('libs.recruits')
local buildings = require('libs.buildings')
local maps = require('libs.maps')
local utils = require('libs.utils')

--[[
A simple structure that will serve as a 
starter template for our isolation (mini)games
]]--
BasicGame = {
  mode = nil,
  player1 = nil,
  player2 = nil,
  levels = {}
}
function BasicGame.render(self, level)
  maps.draw_meshed_grid(level)
end
function BasicGame.dump(self)
  print('BasicGame.dump()')
  print(inspect(self))
end

BasicGameMode = {}
function BasicGameMode.new(self, name)
  local gMode = {}
  gMode.name = name or nil
  
  self.__index = self
  return setmetatable(gMode, self)
end
function BasicGameMode.debug(self)
  print('BasicGame.dump()')
  print(inspect(self))
end
game_modes = {
  menu = 0,
  loading = 1,
  cinematic = 2,
  adventure = 3,
  royal = 4,
  waves = 5,
  test = 6,
  credits = 7,
  quit = 8,
  settings = 9
}

function BasicGame.setup(display_width, display_height)
    math.randomseed(os.time())
    
    mesh_order = {"a", "b", "c", "d"}
    grid_size = 50
    max_x_offset = 20
    max_y_offset = 20

    grunt = recruits.Recruit:new{150, 10, 100}
    powerplant = buildings.Building:new()

    player1 = {}
    player1.menu = {}
    player1.menu.units = {grunt}
    player1.menu.buildings = {powerplant}

    grid_1 = maps.grid(display_width, display_height, grid_size)
    grid_2 = maps.funny_grid(display_width, display_height, grid_size)

    local new_game = BasicGame
    new_game.mode = game_modes[menu]
    new_game.player1 = player1
    new_game.levels = {
      grid = grid_1,
      funny_grid = grid_2
    }
    
    return new_game
end

return BasicGame