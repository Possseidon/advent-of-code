local fish = {}
local fish7 = 0
local fish8 = 0

for i = 0, 6 do
  fish[i] = 0
end

local line = io.lines("input.txt")()
for f in line:gmatch("%d+") do
  f = assert(tonumber(f))
  fish[f] = fish[f] + 1
end

local function getTotal()
  local sum = 0
  for i = 0, 6 do
    sum = sum + fish[i]
  end
  sum = sum + fish7 + fish8
  return sum
end

for day = 1, 256 do
  local last = (day + 6) % 7
  local old = fish[last]
  fish[last] = fish[last] + fish7
  fish7 = fish8
  fish8 = old
  --[[
  io.write(day, ":\t")
  for i = 0, 6 do
    io.write(fish[(day + i - 1) % 7], " ")
  end
  io.write(fish7, " ", fish8, "\t", getTotal(), "\n")
  ]]
end

print(getTotal())
