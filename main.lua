local inspect = require("inspect")

function love.load()
    fullsreen_success = love.window.setFullscreen(true)
    display_width = love.graphics.getWidth()
    display_height = love.graphics.getHeight()
    grid_size = 50

    print('PREPARING GRID. Width: ' .. display_width .. "; Height: " .. display_height .. "; Size: " .. grid_size)
    grid_1 = grid(display_width, display_height, grid_size)
    print("Total tiles: " .. tablelength(grid_1))
end

function love.update(dt) end

function love.draw()
    tile_check = true
    -- print('DRAWING GRID WITH TYPE ' .. type(grid_1))
    for tile_id, tile in ipairs(grid_1) do
        if tile_check then
            love.graphics.setColor(255,255,255)
        else
            love.graphics.setColor(0,0,0)
        end
        -- print('TILE ' .. tile_id .. ": type " .. type(tile))
        love.graphics.rectangle("fill", tile.TL.x, tile.TL.y, grid_size, grid_size)
        tile_check = not tile_check
        -- print(inspect(tile))
        -- print("")
    end
    -- love.event.quit()
    -- for tile_id, tile in pairs(grid_1) do 
    --     print(inspect(tile))
    -- end

    -- love.graphics.print('Hello world ' .. width .. 'x' .. height)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        local mouseToTarget = pythagoras(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            score = score + 1
            target.x = math.random(target.radius,
                                   love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius,
                                   love.graphics.getHeight() - target.radius)
        end
    end
end

function pythagoras(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function funny_grid(width, height, size, offset)
    local grid = {}
    local intersectionX = -90
    local intersectionY = -70
     

    for x_pos = 0, width, size do
        for y_pos = 0, width, size do
            local tile = {
                TL = {x = x_pos, y = y_pos}, 
                BL = {x = x_pos + size, y = y_pos}, 
                TR = {x = x_pos, y = y_pos + size}, 
                BR = {x = x_pos + size, y = y_pos + size}
            }
            
            -- if math.fmod(x,y)
            -- tile.BR.x = tile.BR.x + intersectionX
            -- a.path.y3 = intersectionY
             
            -- b.path.x2 = intersectionX
            -- b.path.y2 = intersectionY
             
            -- c.path.x4 = intersectionX
            -- c.path.y4 = intersectionY
             
            -- d.path.x1 = intersectionX
            -- d.path.y1 = intersectionY
            table.insert(grid, tile)
        end
    end
end

function grid(width, height, size)
    local grid = {}

    for x_pos = 0, width, size do
        for y_pos = 0, height, size do
            local tile = {
                TL = {x = x_pos, y = y_pos}, 
                BL = {x = x_pos + size, y = y_pos}, 
                TR = {x = x_pos, y = y_pos + size}, 
                BR = {x = x_pos + size, y = y_pos + size}
            }
            table.insert(grid, tile)
        end
    end
    return grid
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function mesh() end