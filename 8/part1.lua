local easy_digits = {
  [2] = 1,
  [4] = 4,
  [3] = 7,
  [7] = 8
}

local sum = 0
for line in io.lines("input.txt") do
  local splitter = line:gmatch("[^|]+")
  splitter()
  local value = splitter()

  for code in value:gmatch("[a-g]+") do
    if easy_digits[#code] then
      sum = sum + 1
    end
  end
end

print(sum)
