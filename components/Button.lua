local inspect = require('libs.inspect')

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

return Button