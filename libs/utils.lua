local utils = {}

function utils.tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end


function utils.calculate_z_component(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function utils.calculate_x_and_y_components(a, z)
  local x = z * math.cos(math.rad(a))
  local y = z * math.sin(math.rad(a))
  
  return {x, y}
end


return utils