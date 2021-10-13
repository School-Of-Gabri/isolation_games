local recruits = require('libs.recruits')
local buildings = require('libs.buildings')
local maps = require('libs.maps')
local utils = require('libs.utils')
local ui = require('libs.ui')
local Game = require('components.GameMode')

function setup(display_width, display_height)
  math.randomseed(os.time())
  
  grunt = recruits.Recruit:new{150, 10, 100}
  powerplant = buildings.Building:new()

  player1 = {}
  player1.menu = {}
  player1.menu.units = {grunt}
  player1.menu.buildings = {powerplant}

  grid_1 = maps.grid(display_width, display_height)
  grid_2 = maps.funny_grid(display_width, display_height, grid_size)

  local new_game = Game.new('Isolation games - Game 1')
  new_game.player1 = player1
  new_game.levels = {
    grid = grid_1,
    funny_grid = grid_2
  }

  return new_game
end

return setup