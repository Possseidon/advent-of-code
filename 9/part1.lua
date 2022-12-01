local height_map = {}

for line in io.lines("input.txt") do
  table.insert(height_map, line)
end

local function at(x, y)
  local line = height_map[y]
  return line and tonumber(line:sub(x, x)) or math.huge
end

local risk = 0

for y = 1, #height_map do
  for x = 1, #height_map[y] do
    local mid = at(x, y)
    local l = at(x - 1, y)
    local r = at(x + 1, y)
    local u = at(x, y - 1)
    local d = at(x, y + 1)
    if mid < l and mid < r and mid < u and mid < d then
      risk = risk + mid + 1
    end
  end
end

print(risk)
