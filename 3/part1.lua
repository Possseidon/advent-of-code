local input = "input.txt"

local bits = {}
local total = 0
local bit_width = 0

for line in io.lines(input) do
  bit_width = #line
  break
end

for i = 1, bit_width do
  bits[i] = 0
end

for line in io.lines(input) do
  local num = tonumber(line, 2)
  for i = 1, bit_width do
    bits[i] = bits[i] + ((num >> (i - 1)) & 1)
  end

  total = total + 1
end

local gamma_rate = 0

for i = 1, bit_width do
  if bits[i] > total / 2 then
    gamma_rate = gamma_rate | (1 << (i - 1))
  end
end

local epsilon_rate = (1 << bit_width) - 1 - gamma_rate

print(gamma_rate * epsilon_rate)
