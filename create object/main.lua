
Rect = {
  x = 0, y = 0,
  width = 0, height = 0,

  New = function()
    local rect = {}

    rect.x = Rect.x
    rect.y = Rect.y
    rect.width = Rect.width
    rect.height = Rect.height

    return rect

  end,

  move = function(r,x,y)
    r.x = r.x + x
    r.y = r.y + y
  end

}

function love.load()

  message_alert = false
  score = 0

  rect_1 = Rect.New()
  rect_1.x = 50
  rect_1.y = 50
  rect_1.width = 20
  rect_1.height = 20

  rect_2 = Rect.New()
  rect_2.x = 0
  rect_2.y = 0
  rect_2.width = 20
  rect_2.height = 20

  red_zone = Rect.New()
  red_zone.width = 200
  red_zone.height = 200

end

function love.update(dt)

  red_zone.x = (rect_2.x + 10) - 100
  red_zone.y = (rect_2.y + 10) - 100

  if love.keyboard.isDown('right') then
    rect_1.x = rect_1.x + 5
  end
  if love.keyboard.isDown('left') then
    rect_1.x = rect_1.x - 5
  end
  if love.keyboard.isDown('up') then
    rect_1.y = rect_1.y - 5
  end
  if love.keyboard.isDown('down') then
    rect_1.y = rect_1.y + 5
  end

  if love.keyboard.isDown('d') then
    rect_2.x = rect_2.x + 5
  end
  if love.keyboard.isDown('a') then
    rect_2.x = rect_2.x - 5
  end
  if love.keyboard.isDown('w') then
    rect_2.y = rect_2.y - 5
  end
  if love.keyboard.isDown('s') then
    rect_2.y = rect_2.y + 5
  end

  if rect_2.x ~= rect_1.x then
    if rect_2.x < rect_1.x then
      rect_2.x = rect_2.x + 2
    elseif rect_2.x > rect_1.x then
      rect_2.x = rect_2.x - 2
    end
  end

  if rect_2.y ~= rect_1.y then
    if rect_2.y < rect_1.y then
      rect_2.y = rect_2.y + 2
    elseif rect_2.y > rect_1.y then
      rect_2.y = rect_2.y - 2
    end
  end

  if math.sqrt( ( (rect_1.x - 10) - (rect_2.x - 10) )^2 + ( (rect_1.y - 10) - (rect_2.y - 10) )^2 ) < 100 then
    message_alert = true
    score = score + 4*dt
  else
    message_alert = false
    score = score + 2*dt
  end

  if rect_1.x < rect_2.x + rect_2.width and
  rect_1.x + rect_1.width > rect_2.x and
  rect_1.y < rect_2.y + rect_2.height and
  rect_1.height + rect_1.y > rect_2.y then
    love.event.quit()
  else

  end

end

function love.draw()



  love.graphics.setColor(255,255,255)

  love.graphics.print("Score "..math.floor(score), WIN_WIDTH - 100,0)

  love.graphics.print("rect_1.x = "..rect_1.x)
  love.graphics.print("rect_1.y = "..rect_1.y,0,10)
  love.graphics.print("rect_1.width = "..rect_1.width,0,20)
  love.graphics.print("rect_1.height = "..rect_1.height,0,30)

  love.graphics.print("rect_2.x = "..rect_2.x,150,0)
  love.graphics.print("rect_2.y = "..rect_2.y,150,10)
  love.graphics.print("rect_2.width = "..rect_2.width,150,20)
  love.graphics.print("rect_2.height = "..rect_2.height,150,30)

  love.graphics.rectangle('fill', rect_1.x, rect_1.y, rect_1.width, rect_1.height)
  love.graphics.rectangle('fill', rect_2.x, rect_2.y, rect_2.width, rect_2.height)

  love.graphics.setColor(255,0,0)
  if message_alert then
    love.graphics.print("WARNING",rect_1.x - 20, rect_1.y - 20)
  end
  love.graphics.setColor(255,0,0,30)
  love.graphics.rectangle('fill', red_zone.x, red_zone.y, red_zone.width, red_zone.height)
  love.graphics.setColor(255,255,255)


end


