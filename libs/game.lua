local recruits = require('libs.recruits')
local buildings = require('libs.buildings')
local maps = require('libs.maps')
local utils = require('libs.utils')

local game = {}

BasicGame = {
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

function game.setup()
    fullsreen_success = love.window.setFullscreen(true)
    display_width = love.graphics.getWidth()
    display_height = love.graphics.getHeight()
    love.graphics.setLineWidth(2)

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
    new_game.player1 = player1
    new_game.levels = {
      grid = grid_1,
      funny_grid = grid_2
    }
    
    return new_game
end


return game