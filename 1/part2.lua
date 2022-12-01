local window_size = 3

local function getDepths()
  local depths = {}
  for number in io.lines("input.txt", "n") do
    table.insert(depths, number)
  end
  return depths
end

local depths = getDepths()

local function depthSumAt(index)
  local sum = 0
  for i = index, index + window_size - 1 do
    sum = sum + depths[i]
  end
  return sum
end

local increased_depth_sums = 0
for i = 1, #depths - window_size do
  if depthSumAt(i) < depthSumAt(i + 1) then
    increased_depth_sums = increased_depth_sums + 1
  end
end

print(increased_depth_sums)
