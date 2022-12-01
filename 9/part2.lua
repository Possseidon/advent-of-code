local height_map = {}

for line in io.lines("input.txt") do
  table.insert(height_map, line)
end

local function at(x, y)
  local line = height_map[y]
  return line and tonumber(line:sub(x, x)) or 9
end

local checked_positions = {}

local function checked(x, y)
  return checked_positions[x .. "|" .. y]
end

local function mark(x, y)
  checked_positions[x .. "|" .. y] = true
end

local function markBasin(x, y)
  if checked(x, y) or at(x, y) == 9 then
    return 0
  end
  mark(x, y)
  return 1 +
    markBasin(x - 1, y) +
    markBasin(x + 1, y) +
    markBasin(x, y - 1) +
    markBasin(x, y + 1)
end

local basin_sizes = {}

for y = 1, #height_map do
  for x = 1, #height_map[y] do
    if at(x, y) ~= 9 and not checked(x, y) then
      table.insert(basin_sizes, markBasin(x, y))
    end
  end
end

table.sort(basin_sizes)
local last = #basin_sizes

print(basin_sizes[last] * basin_sizes[last - 1] * basin_sizes[last - 2])
