local inspect = require('libs.inspect')
local maps = {}

function maps.draw_grid(grid)
    local tile_check = true
    local color_a = {0, 0, 0, 255}
    local color_b = {0, 0, 255, 255}

    for tile_id, tile in ipairs(grid) do
        if tile_check then
            love.graphics.setColor(color_a)
        else
            love.graphics.setColor(color_b)
        end

        love.graphics.polygon("fill", tile.TL.x, tile.TL.y, tile.BL.x,
                              tile.BL.y, tile.BR.x, tile.BR.y, tile.TR.x,
                              tile.TR.y)
        tile_check = not tile_check
    end
end


function maps.funny_grid(width, height, size, offset)
    local grid = {}

    for x_pos = 0, width, size do
        for y_pos = 0, width, size do
            curx_rnd = math.floor(math.random() * max_x_offset) - math.floor(max_x_offset / 2)
            cury_rnd = math.floor(math.random() * max_y_offset) - math.floor(max_y_offset / 2)

            table.insert(grid, maps.mesh(x_pos, y_pos, size, size, curx_rnd, cury_rnd))
        end
    end
    return grid
end

function maps.grid(width, height, size)
    local grid = {}
    
    print('width: ' .. inspect(width))
    print('height: ' .. inspect(height))
    print('size: ' .. inspect(size))

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


function maps.mesh(x, y, w, h, x_off, y_off)
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

function maps.draw_meshed_grid(grid)
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
            -- print("MESH group: " .. mo .. "; MESH: " .. inspect(mesh))
            love.graphics.polygon("line", mesh.TL.x, mesh.TL.y, mesh.BL.x,
                                  mesh.BL.y, mesh.BR.x, mesh.BR.y, mesh.TR.x,
                                  mesh.TR.y)
            tile_check = not tile_check
        end
    end
end

function draw_map()

end


return maps