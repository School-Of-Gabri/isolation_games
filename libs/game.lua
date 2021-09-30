local recruits = require('libs.recruits')
local buildings = require('libs.buildings')
local maps = require('libs.maps')
local utils = require('libs.utils')
local ui = require('libs.ui')

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
function BasicGame.render(self, display)
  maps.draw_meshed_grid(self.levels.funny_grid)
  ui.render(display.menu)
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
BasicGame.game_modes = {
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
  
  grunt = recruits.Recruit:new{150, 10, 100}
  powerplant = buildings.Building:new()

  player1 = {}
  player1.menu = {}
  player1.menu.units = {grunt}
  player1.menu.buildings = {powerplant}

  grid_1 = maps.grid(display_width, display_height)
  grid_2 = maps.funny_grid(display_width, display_height, grid_size)

  local new_game = BasicGame
  new_game.mode = BasicGame.game_modes[menu]
  new_game.player1 = player1
  new_game.levels = {
    grid = grid_1,
    funny_grid = grid_2
  }

  return new_game
end

return BasicGame