local inspect = require("inspect")

function love.load()
    fullsreen_success = love.window.setFullscreen(true)
    display_width = love.graphics.getWidth()
    display_height = love.graphics.getHeight()
    love.graphics.setLineWidth(2)

    mesh_order = {"a", "b", "c", "d"}
    grid_size = 100
    intersectionX = -14
    intersectionY = -7

    print('PREPARING GRID. Width: ' .. display_width .. "; Height: " ..
              display_height .. "; Size: " .. grid_size)
    grid_1 = grid(display_width, display_height, grid_size)
    grid_2 = funny_grid(display_width, display_height, grid_size)
    print("Total tiles: " .. tablelength(grid_1))
end

function love.update(dt) end

function love.draw() draw_meshed_grid(grid_2) end

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

function draw_grid(grid)
    local tile_check = true
    local color_a = {0, 0, 0, 255}
    local color_a = {0, 0, 255, 255}

    for tile_id, tile in ipairs(grid) do
        if tile_check then
            love.graphics.setColor(color_a)
        else
            love.graphics.setColor(color_a)
        end

        love.graphics.polygon("fill", tile.TL.x, tile.TL.y, tile.BL.x,
                              tile.BL.y, tile.BR.x, tile.BR.y, tile.TR.x,
                              tile.TR.y)
        tile_check = not tile_check
    end
end

function draw_meshed_grid(grid)

    local tile_check = true
    local color_a = {0, 255, 0, 255}
    local color_b = {0, 0, 255, 255}

    for tile_id, tile in ipairs(grid) do

        for moid, mo in ipairs(mesh_order) do
            if tile_check then
                love.graphics.setColor(color_a)
            else
                love.graphics.setColor(color_b)
            end

            mesh = tile[mo]
            print("MESH group: " .. mo .. "; MESH: " .. inspect(mesh))
            love.graphics.polygon("line", mesh.TL.x, mesh.TL.y, mesh.BL.x,
                                  mesh.BL.y, mesh.BR.x, mesh.BR.y, mesh.TR.x,
                                  mesh.TR.y)
            tile_check = not tile_check
        end
    end
end

function funny_grid(width, height, size, offset)
    local grid = {}

    for x_pos = 0, width, size do
        for y_pos = 0, width, size do
            local tile = mesh(x_pos, y_pos, size, size, intersectionX,
                              intersectionY)

            table.insert(grid, tile)
        end
    end
    return grid
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

function mesh(x, y, w, h, x_off, y_off)
    local segw = math.floor(w / 2)
    local segh = math.floor(h / 2)
    local group = {}
    group.a = {
        TL = {x = x, y = y},
        TR = {x = x + segw, y = y},
        BL = {x = x, y = y + segh},
        BR = {x = x + segw + x_off, y = y + segh + y_off}
    }
    group.b = {
        TL = {x = x + segw, y = y},
        TR = {x = x + w, y = y},
        BL = {x = x + segw + x_off, y = y + segh + y_off},
        BR = {x = x + w, y = y + segh}
    }
    group.c = {
        TL = {x = x, y = y + segh},
        TR = {x = x + segw + x_off, y = y + segh + y_off},
        BL = {x = x, y = y + h},
        BR = {x = x + segw, y = y + h}
    }
    group.d = {
        TL = {x = x + segw + x_off, y = y + segh + y_off},
        TR = {x = x + w, y = y + segh},
        BL = {x = x + segw, y = y + h},
        BR = {x = x + w, y = y + w}
    }
    return group
end
