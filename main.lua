local game = require('libs.game')

function love.load()
    current_game = game.setup()
end

function love.update(dt)

end

function love.draw() 
    current_game:render(current_game.levels.funny_grid)
end

