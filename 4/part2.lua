local function readFile()
    local lines = io.lines("input.txt")

    local header = lines()
    local order = {}
    for num in header:gmatch("%d+") do
      table.insert(order, tonumber(num))
    end

    local cards = {}
    local card_index = 0
    local row_index = 0
    for line in lines do
      if line == "" then
        card_index = card_index + 1
        row_index = 0
        cards[card_index] = {}
      else
        row_index = row_index + 1
        cards[card_index][row_index] = {}
        for num in line:gmatch("%d+") do
          table.insert(cards[card_index][row_index], tonumber(num))
        end
      end
    end

    return order, cards
  end

  local order, cards = readFile()
  local cards_in_play = #cards

  local draw_index = 0
  local function drawNumber()
    draw_index = draw_index + 1
    return order[draw_index]
  end

  local function markCard(card, number)
    for row = 1, #card do
      for col = 1, #card[row] do
        if card[row][col] == number then
          card[row][col] = "x"
        end
      end
    end
  end

  local function checkCard(card)
    -- horizontal lines
    for _, row in ipairs(card) do
      local full_row = true
      for _, number in ipairs(row) do
        if number ~= "x" then
          full_row = false
          break
        end
      end
      if full_row then
        return true
      end
    end

    -- vertical lines
    for col = 1, #card[1] do
      local full_col = true
      for row = 1, #card do
        if card[row][col] ~= "x" then
          full_col = false
          break
        end
      end
      if full_col then
        return true
      end
    end
  end

  local function sumCard(card)
    local sum = 0
    for _, row in ipairs(card) do
      for _, number in ipairs(row) do
        if number ~= "x" then
          sum = sum + number
        end
      end
    end
    return sum
  end

  for number in drawNumber do
    for index, card in ipairs(cards) do
      if card then
        markCard(card, number)
        if checkCard(card) then
          cards[index] = false
          cards_in_play = cards_in_play - 1
          if cards_in_play == 0 then
            print(sumCard(card) * number)
            return
          end
        end
      end
    end
  end
