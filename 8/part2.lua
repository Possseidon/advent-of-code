
local function swap(items, i, j)
  items[i], items[j] = items[j], items[i]
end

local function reverse(items, first, last)
  first = first or 1
  last = last or #items
  while first < last do
    swap(items, first, last)
    first = first + 1
    last = last - 1
  end
end

local function nextPermutation(items, first, last)
  first = first or 1
  last = (last or #items) + 1
  if first == last then
    return false
  end
  local i = last - 1
  if first == i then
    return false
  end

  while true do
    local i1 = i
    i = i - 1
    if items[i] < items[i1] then
      local i2 = last
      repeat
        i2 = i2 - 1
      until items[i] < items[i2]
      swap(items, i, i2)
      reverse(items, i1, last - 1)
      return true
    end
    if i == first then
      reverse(items, first, last - 1)
      return false
    end
  end
end

local function permuteCode(code, mapping)
  return code:gsub(".", function(char)
    return mapping[char:byte() - 96]
  end)
end

local digit_lookup = {}

local digits = {
  abcefg = 0,
  cf = 1,
  acdeg = 2,
  acdfg = 3,
  bcdf = 4,
  abdfg = 5,
  abdefg = 6,
  acf = 7,
  abcdefg = 8,
  abcdfg = 9
}

for code, num in pairs(digits) do
  local chars = {}
  for i = 1, #code do
    chars[i] = code:sub(i, i)
  end
  repeat
    digit_lookup[table.concat(chars)] = num
  until not nextPermutation(chars)
end

local sum = 0
for line in io.lines("input.txt") do
  local splitter = line:gmatch("[^|]+")
  local all = splitter()
  local value = splitter()

  local mapping = { "a", "b", "c", "d", "e", "f", "g" }
  repeat
    for code in all:gmatch("[a-g]+") do
      if not digit_lookup[permuteCode(code, mapping)] then
        goto continue
      end
    end

    break
    ::continue::
  until not nextPermutation(mapping)

  local result = ""
  for code in value:gmatch("[a-g]+") do
    result = result .. digit_lookup[permuteCode(code, mapping)]
  end

  sum = sum + result

end

print(sum)
