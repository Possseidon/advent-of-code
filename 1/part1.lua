local incresed_depths = 0

local last_depth
for depth in io.lines("input.txt", "n") do
  if last_depth then
    if depth > last_depth then
      incresed_depths = incresed_depths + 1
    end
  end
  last_depth = depth
end

print(incresed_depths)
