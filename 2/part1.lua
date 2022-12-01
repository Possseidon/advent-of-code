local x, y = 0, 0

local commands = {
  forward = function(n)
    x = x + n
  end,
  down = function(n)
    y = y + n
  end,
  up = function(n)
    y = y - n
  end
}

for line in io.lines("input.txt") do
  local command, count = line:match("(%a+) (%d+)")
  commands[command](count)
end

print(x * y)
