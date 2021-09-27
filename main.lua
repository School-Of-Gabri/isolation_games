local game = require('libs.game')
local ui = require('libs.ui')
local inspect = require('libs.inspect')
local lume = require"libs.lume.lume"

function love.load()
  display = ui.setup()
  current_game = game.setup(display['width'], display['height'])
  print('Lume: ' .. inspect(lume))
end

function love.update(dt)

end

function love.draw() 
    current_game:render(current_game.levels.funny_grid)
end

function test_lume()
end