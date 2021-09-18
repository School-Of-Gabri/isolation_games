function love.load()

    success = love.window.setFullscreen(true)
    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()
    grid_size = 10
    local inspect = require("inspect")

    grid_1 = grid(WIDTH, HEIGHT, grid_size)
    print(inspect(grid_1))
end

function love.update(dt) end

function love.draw()
  for tile_id, tile in pairs(grid_1) do
    print(inspect(tile))
  end
  success = love.window.setFullscreen(true)

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  love.graphics.print('Hello world ' .. width .. 'x' .. height)
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

function grid(width, height, size)
    local grid = {}

    for x_pos = 0, height, 10 do
        for y_pos = 0, width, 10 do
            local point_1 = {x_pos, y_pos}
            local point_2 = {x_pos + size, y_pos}
            local point_3 = {x_pos, y_pos + size}
            local point_4 = {x_pos + size, y_pos + size}
            local tile = {point_1, point_2, point_3, point_4}
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