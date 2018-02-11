BOARD_SETTINGS = {
  offset = {
    x = 32,
    y = 44
  },
  square = {
    length = 64
  }
}

function initGlobals()
  ACTIONS = {}
  ACTION_INDEX = 1
  PAWNS = {}
  delay_timer = 0
  playingBack = false
  INPUT_FILENAME = 'input.txt'
end

-- Function called by the 'RESET' button
function resetEverything()
  for i=0,#PAWNS do
    local pawn = PAWNS[i]
    if pawn then
      pawn:destroy()
    end
  end

  initGlobals()
  love.load(preserveArgs)
end

-- Create all the pawns
function initializePawns()
  local id_counter = 0
  for y = 0,7 do
    for x = 0,7 do
      if x % 2 ~= y % 2 and y < 3 then
        Pawn(id_counter,x,y)
        id_counter = id_counter + 1
      end
      if x % 2 ~= y % 2 and y > 4 then
        Pawn(id_counter,x,y)
        id_counter = id_counter + 1
      end
    end
  end
end

initGlobals()
