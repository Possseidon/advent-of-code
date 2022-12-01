local input = "input.txt"

local bit_width = 0

for line in io.lines(input) do
  bit_width = #line
  break
end

local all_values = {}

local function copy(t)
  return table.move(t, 1, #t, 1, {})
end

for line in io.lines(input) do
  local num = tonumber(line, 2)
  table.insert(all_values, num)
end

local function filter(values, invert, bit)
  bit = bit or (bit_width - 1)

  local one_bits = 0
  for _, value in ipairs(values) do
    one_bits = one_bits + ((value >> bit) & 1)
  end

  local keep = (one_bits >= #values / 2) ~= invert
  for i = #values, 1, -1 do
    if (values[i] & (1 << bit) ~= 0) ~= keep then
      table.remove(values, i)
    end
  end

  if #values == 1 then
    return values[1]
  end
  return filter(values, invert, bit - 1)
end

local oxygen = filter(copy(all_values), false)
local co2 = filter(copy(all_values), true)

print(oxygen * co2)
