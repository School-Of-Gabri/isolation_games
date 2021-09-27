local ui = {}

local BasicButton = {
  text = nil,
  fn = function()
    print("BasicButton:fn()")
  end
}

local Button = {}

function Button.new(self, text, fn)
  local btn = BasicButton
  if text then
    btn.text = text
  end
  if fn then
    btn.fn = fn
  end
    
  self.__index = self
  return setmetatable(newBld, self)
end

function Button.dump(self)
  print('Button.dump()')
  print(inspect(self))
end

ui.Button = Button

function ui.setup()
  fullsreen_success = love.window.setFullscreen(true)
  display_width = love.graphics.getWidth()
  display_height = love.graphics.getHeight()
  love.graphics.setLineWidth(2)
  
  return {
    width = display_width, 
    height = display_height
  }
end

return ui