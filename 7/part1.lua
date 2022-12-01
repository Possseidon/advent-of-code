local input = io.lines("input.txt")()
local crabs = {}
local crab_min, crab_max = math.huge, -math.huge
for pos in input:gmatch("%d+") do
  pos = tonumber(pos)
  table.insert(crabs, pos)
  crab_min = math.min(crab_min, pos)
  crab_max = math.max(crab_max, pos)
end

local function getCrabMovements(to)
  local total = 0
  for _, crab in ipairs(crabs) do
    total = total + math.abs(crab - to)
  end
  return total
end

local min_movements = math.huge
for pos = crab_min, crab_max do
  min_movements = math.min(min_movements, getCrabMovements(pos))
end

print(min_movements)
