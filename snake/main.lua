
snakeBodyX = {}
snakeBodyY = {}

spawnFruit = {
  x = 0,
  y = 0,

  New = function()
    SpawnFruit = {}
    spawnFruit.x = SpawnFruit.x
    spawnFruit.y = SpawnFruit.y

    return SpawnFruit
  end

}

snakeHead = {x = 0, y = 0, width = 20, height = 20}


function love.load()

  divideSpeed = 0
  nbFruit = 0

  lastAction = ""
  currentAction = ""

  fruitDead = true

  goRight = true
  goLeft = false
  goUp = false
  goDown = false

  grid = {sepX = 20, sepY = 20}

  FRUIT_X = 5
  FRUIT_Y = 5

  fruit = spawnFruit.New()


end

function love.update(dt)

  -- Logic speed in function of nbFruit

  if nbFruit >= 0 and nbFruit < 15 then
    divideSpeed = 4
  elseif nbFruit >= 15 then
    divideSpeed = 2
  end

-- end logic speed in function of nbFruit

--- fruit
  if fruitDead == true then
    randX = math.random(WIN_WIDTH/grid.sepX)
    randY = math.random(WIN_HEIGHT/grid.sepY)
    print("randX : "..randX)
    print("randY : "..randY)
    print()
    fruitDead = false
  end

  fruit.x = randX
  fruit.y = randY

--- end fruit

--- mouvement

  if love.keyboard.isDown('left') then
    goLeft = true
    goRight = false
    goUp = false
    goDown = false
  end

  if love.keyboard.isDown('right') then
    goLeft = false
    goRight = true
    goDown = false
    goUp = false
  end

  if love.keyboard.isDown('down') then
    goLeft = false
    goRight = false
    goDown = true
    goUp = false
  end

  if love.keyboard.isDown('up') then
    goLeft = false
    goRight = false
    goDown = false
    goUp = true
  end

  if goRight then
    snakeHead.x = snakeHead.x + grid.sepX/divideSpeed

    if currentAction == "goLeft" then
      lastAction = "goLeft"
    elseif currentAction == "goDown" then
      lastAction = "goDown"
    elseif currentAction == "goUp" then
      lastAction = "goUp"
    end

    currentAction = "goRight"

    if lastAction == "goDown" or lastAction == "goUp" then
      if snakeHead.y % grid.sepY ~= 0 then
        snakeHead.y = snakeHead.y - (grid.sepY/divideSpeed)
      end
    end

  end

  if goLeft then
    snakeHead.x = snakeHead.x - grid.sepX/divideSpeed

    if currentAction == "goRight" then
      lastAction = "goRight"
    elseif currentAction == "goDown" then
      lastAction = "goDown"
    elseif currentAction == "goUp" then
      lastAction = "goUp"
    end

    currentAction = "goLeft"

    if lastAction == "goDown" or lastAction == "goUp" then
      if snakeHead.y % grid.sepY ~= 0 then
        snakeHead.y = snakeHead.y - (grid.sepY/divideSpeed)
      end
    end

  end

  if goDown then
    snakeHead.y = snakeHead.y + grid.sepY/divideSpeed

    if currentAction == "goRight" then
      lastAction = "goRight"
    elseif currentAction == "goLeft" then
      lastAction = "goLeft"
    elseif currentAction == "goUp" then
      lastAction = "goUp"
    end

    currentAction = "goDown"

    if lastAction == "goRight" or lastAction == "goLeft" then
      if snakeHead.x % grid.sepX ~= 0 then
        snakeHead.x = snakeHead.x - (grid.sepY/divideSpeed)
      end
    end

  end

  if goUp then
    snakeHead.y = snakeHead.y - grid.sepY/divideSpeed

    if currentAction == "goRight" then
      lastAction = "goRight"
    elseif currentAction == "goLeft" then
      lastAction = "goLeft"
    elseif currentAction == "goDown" then
      lastAction = "goDown"
    end

    currentAction = "goUp"

    if lastAction == "goRight" or lastAction == "goLeft" then
      if snakeHead.x % grid.sepX ~= 0 then
        snakeHead.x = snakeHead.x - (grid.sepY/divideSpeed)
      end
    end

  end

-- end movement 

-- border collision

  if snakeHead.x + snakeHead.width > WIN_WIDTH then
    love.event.quit()
  end

  if snakeHead.y < 0 then
    love.event.quit()
  end

  if snakeHead.x < 0 then
    love.event.quit()
  end

  if snakeHead.y + snakeHead.height > WIN_HEIGHT then
    love.event.quit()
  end

-- end border collision

-- collision snakeHead - fruit

  if snakeHead.x < (fruit.x*grid.sepX - 12) + FRUIT_X and
  snakeHead.x + snakeHead.width > (fruit.x*grid.sepX - 12) and
  snakeHead.y < (fruit.y*grid.sepY - 12) + FRUIT_Y and
  snakeHead.height + snakeHead.y > (fruit.y*grid.sepY - 12) then
    fruitDead = true
    nbFruit = nbFruit + 1

    table.insert(snakeBodyX,#snakeBodyX)
    table.insert(snakeBodyY,#snakeBodyY)

  else
    fruitDead = false
  end

-- end collision snakeHead - fruit

-- snakeBody

  for i = 0, #snakeBodyX do

    if currentAction == "goLeft" then
      snakeBodyX[i] = snakeHead.x + snakeHead.width*i
      snakeBodyY[i] = snakeHead.y
    end

    if currentAction == "goRight" then
      snakeBodyX[i] = snakeHead.x - snakeHead.width*i
      snakeBodyY[i] = snakeHead.y
      
    end
  
    if currentAction == "goDown" then
      snakeBodyX[i] = snakeHead.x
      snakeBodyY[i] = snakeHead.y - snakeHead.height*i

    end

    if currentAction == "goUp" then
      snakeBodyX[i] = snakeHead.x
      snakeBodyY[i] = snakeHead.y + snakeHead.height*i
      print(snakeBodyX[i])
    end

    nbSnakeBody = nbFruit


-- end snakeBody


  end

  function love.draw()
    love.graphics.setBackgroundColor(45,45,45)

    love.graphics.setColor(255,255,255)
    for i = 1, WIN_HEIGHT/grid.sepY , 1 do 
      love.graphics.line(0, i*grid.sepY,WIN_HEIGHT,i*grid.sepY)
    end

    for i = 1, WIN_WIDTH/grid.sepX , 1 do 
      love.graphics.line(i*grid.sepX,0,i*grid.sepX,WIN_HEIGHT)
    end

    love.graphics.print("SCORE : "..nbFruit,WIN_WIDTH/2 - 50,0)

    --love.graphics.print(tostring(love.timer.getFPS()))

    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", fruit.x*grid.sepX - 12, fruit.y*grid.sepY - 12, FRUIT_X, FRUIT_Y) -- Le -12 sert a centrer le fruit

    love.graphics.setColor(0,125,0)
    love.graphics.rectangle("fill", snakeHead.x, snakeHead.y, snakeHead.width, snakeHead.height)

    if #snakeBodyX > 0 then

      for i = 0,#snakeBodyX,1 do
        love.graphics.rectangle('fill',snakeBodyX[i],snakeBodyY[i],snakeHead.width,snakeHead.height)
      end

    end

  end




  function love.mousemoved()

  end

  function love.mousepressed()

  end

  function love.keypressed(key)
    if key == 'e' then
      fruitDead = true
    else
      fruitDead = false
    end
  end
end