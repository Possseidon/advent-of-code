local grid = {}
local max_x, max_y = 0, 0

local function markGrid(x, y)
  grid[y] = grid[y] or {}
  local row = grid[y]
  row[x] = row[x] and row[x] + 1 or 1
  max_x = math.max(max_x, x)
  max_y = math.max(max_y, y)
end

local function sort(a, b)
  if a < b then
    return a, b
  end
  return b, a
end

for line in io.lines("input_small.txt") do
  local x1, y1, x2, y2 = line:match("(%d+),(%d+) .. (%d+),(%d+)")
  x1 = tonumber(x1)
  y1 = tonumber(y1)
  x2 = tonumber(x2)
  y2 = tonumber(y2)

  if x1 == x2 or y1 == y2 then
    x1, x2 = sort(x1, x2)
    y1, y2 = sort(y1, y2)
    for x = x1, x2 do
      for y = y1, y2 do
        markGrid(x, y)
      end
    end
  end
end

local count = 0
for y = 0, max_y do
  local row = grid[y] or {}
  for x = 0, max_x do
    local value = row[x] or 0
    io.write(value == 0 and "." or value)
    if value > 1 then
      count = count + 1
    end
  end
  print()
end

print(count)
