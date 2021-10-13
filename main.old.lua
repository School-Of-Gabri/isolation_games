#! /usr/bin/env love

local game = require('libs.game')
local ui = require('libs.ui')
local inspect = require('libs.inspect')
local lume = require"libs.lume.lume"

function love.load()
  display = ui.setup()
  current_game = game(display['width'], display['height'])

  -- print('Lume: ' .. inspect(lume))
  
  print('Current game:')
  current_game:dump()
end

function love.update(dt)

end

function love.draw() 
    -- current_game:render()
    -- love.event.quit(0)
  --current_game:render(display)
end

function test_lume()
end