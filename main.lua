function love.draw()
  success = love.window.setFullscreen( true )

  width = love.graphics.getWidth( )

  love.graphics.print('Hello world ' .. width)
end
