local x, y = 0, 0
local aim = 0

local commands = {
  forward = function(n)
    x = x + n
    y = y + aim * n
  end,
  down = function(n)
    aim = aim + n
  end,
  up = function(n)
    aim = aim - n
  end
}

for line in io.lines("input.txt") do
  local command, count = line:match("(%a+) (%d+)")
  commands[command](count)
end

print(x * y)
