#! /usr/bin/env lua
local inspect = require('inspect')

-- BasicButton
local BasicButton = {}  
BasicButton.__index = BasicButton

function BasicButton.new(text, fn)
  local self = setmetatable({}, BasicButton)
  self.text = text
  self.fn = fn
  return self
end

function BasicButton:render()
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
  print('Self: ' .. inspect(self))
end


local a = Button.new('Hello', function()
    print('Hello clicked!')
  end)
local b = Button.new('Bye', function()
    print('Bye clicked!')
  end)

print('A:')
a:dump()
print('########')
print('B:')
b:dump()
print('########')
