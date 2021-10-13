#! /usr/bin/env love

local game = require('libs.game')
local ui = require('libs.ui')
local inspect = require('libs.inspect')
local lume = require"libs.lume.lume"
local Recruit = require('components.Recruit')

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  display = ui.setup()
  current_game = game(display['width'], display['height'])

  -- print('Lume: ' .. inspect(lume))
  
  -- print('Current game:')
  -- current_game:dump()
  
  local recruit1 = Recruit("Gabriel")
  print("Recruit 1 at " .. recruit1.health .. " health.")
end

function love.update(dt)

end

function love.draw() 
  -- current_game:render()
  love.event.quit(0)
  --current_game:render(display)
end
