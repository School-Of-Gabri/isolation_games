local inspect = require('libs.inspect')
local Button = require('components.Button')

local ui = {}

-- ui.Button = Button

function ui.setup()
  fullsreen_success = love.window.setFullscreen(true)
  display_width = love.graphics.getWidth()
  display_height = love.graphics.getHeight()
  love.graphics.setLineWidth(2)
  
  local MainMenu = {}
  table.insert(MainMenu, Button.new("Start Game", function()
          print("# New game clicked")
        end))
  table.insert(MainMenu, Button.new("Load Game", function()
          print("# Load game clicked")
        end))
  table.insert(MainMenu, Button.new("Save Game", function()
          print("# Save game clicked")
        end))
  table.insert(MainMenu, Button.new("Settings", function()
          print("# Settings clicked")
        end))
  table.insert(MainMenu, Button.new("Exit", function()
          print("# Exit clicked")
        end))
  return {
    width = display_width, 
    height = display_height,
    menu = MainMenu
  }
end

function ui.srender(buttons)
  print('ui.render()')
  -- print('buttons: ' .. inspect(buttons))
  
  for btn_id, button in ipairs(buttons) do
    print('Button ' .. btn_id .. ': ' .. button.text)
    button:render()
    break
  end
end

return ui