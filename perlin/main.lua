
local inspect = require('inspect')
local grid = {}


-- Converts HSV to RGB. (input and output range: 0 - 255)

function HSV(h, s, v)
    if s <= 0 then return v,v,v end
    h, s, v = h/256*6, s/255, v/255
    local c = v*s
    local x = (1-math.abs((h%2)-1))*c
    local m,r,g,b = (v-c), 0,0,0
    if h < 1     then r,g,b = c,x,0
    elseif h < 2 then r,g,b = x,c,0
    elseif h < 3 then r,g,b = 0,c,x
    elseif h < 4 then r,g,b = 0,x,c
    elseif h < 5 then r,g,b = x,0,c
    else              r,g,b = c,0,x
    end return (r+m)*255,(g+m)*255,(b+m)*255
end

function love.draw()
    for x = 1, #grid do
        for y = 1, #grid[x] do
            local f = 1 * grid[x][y]
            love.graphics.setColor( f, f, f, 1 )
            love.graphics.rectangle( 'fill', x * 4, y * 4, 3, 3 )
            love.graphics.setColor( 1, 1, 1, 1 )
        end
    end
end

-- Fill each pixel in our grid with simplex noise.
local function noise()
    for x = 1, 600 do
        for y = 1, 600 do
            grid[x] = grid[x] or {}
            grid[x][y] = love.math.noise( x + love.math.random(), y + love.math.random() )
        end
    end
end

function love.update(dt)
  print('dt: ' .. inspect(dt))
  noise()
end

function love.keypressed()
    noise()
end