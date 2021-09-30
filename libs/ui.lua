local inspect = require('libs.inspect')

local ui = {}

-- BasicButton
local BasicButton = {
  height = 64
}
BasicButton.__index = BasicButton
function BasicButton.new(text, fn)
  local self = setmetatable({}, BasicButton)
  self.text = text
  self.fn = fn
  return self
end
function BasicButton:fn()
  print('BasicButton.fn()')
  print('Self: ' .. inspect(self))
end

-- Button
local Button = {}
Button.__index = Button
function Button.new(text, fn)
  local self = setmetatable({}, Button)
  self.text = text
  self.fn = fn
  return self
end
setmetatable(Button, {__index = BasicButton})
function Button:dump()
  print('Button.dump()')
  print(inspect(self))
end

function Button.render(x, y)
  print('Button.render()')
  print('Self: ' .. inspect(self))
  print('x: ' .. inspect(x))
  print('y: ' .. inspect(y))
end

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

function ui.render(buttons)
  print('ui.render()')
  -- print('buttons: ' .. inspect(buttons))
  
  for btn_id, button in ipairs(buttons) do
    print('Button ' .. btn_id .. ': ' .. button.text)
  end
end

return ui