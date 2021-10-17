#! /usr/bin/env love

local game = require('libs.game')
local ui = require('libs.ui')
local inspect = require('libs.inspect')
local lume = require"libs.lume.lume"
-- local Recruit = require('components.Recruit')
local Recruit = require("components2.Recruit")

function love.load()
  print("love.load()")
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  display = ui.setup()
  current_game = game(display['width'], display['height'])

  -- print('Lume: ' .. inspect(lume))
  
  -- print('Current game:')
  -- current_game:dump()
  
  local gabri = Recruit.new("Gabri")
  local james = Recruit.new("James")


  print("Gabri health (b4): " .. gabri:get_health())
  print("James health (b4): " .. james:get_health())
  
  james:attack(gabri)
  
  print("Gabri health: " .. gabri:get_health())
  print("James health: " .. james:get_health())

end

function love.update(dt)

end

function love.draw() 
  -- current_game:render()
  love.event.quit(0)
  --current_game:render(display)
end
