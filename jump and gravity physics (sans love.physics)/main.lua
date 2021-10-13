Object = {
  x = 0,
  y = 0,
  width = 0,
  height = 0,
  xspeed = 0,
  yspeed = 0,

  New = function()
    local object = {}

    object.x = Object.x
    object.y = Object.y
    object.width = Object.width
    object.height = Object.height
    object.xspeed = Object.xspeed
    object.yspeed = Object.yspeed

    return object

  end,
  
  move = function(x,y)
    Object.x = Object.x + x
    Object.y = Object.y + y
  end
    
  
  

}


gravity = 40

gameOver = false

player = Object.New() 
player.x = 400
player.y = 0
player.width = 20
player.height = 40
player.xSpeed = 0
player.ySpeed = 200



function love.draw()

  love.graphics.setColor(255,0,0)
  love.graphics.rectangle('fill', player.x, player.y, player.width,player.height)
  love.graphics.setColor(255,255,255)
  love.graphics.print(love.timer.getFPS())

  if gameOver then
    love.graphics.print("Game Over", WIN_WIDTH/2, WIN_HEIGHT/2)
  end

end

function love.update(dt)

  player.x = player.x + player.xSpeed*dt
  player.y = player.y + player.ySpeed*dt

  player.ySpeed = player.ySpeed


  if love.keyboard.isDown('left') then
    player.x = player.x - 5
  end

  if love.keyboard.isDown('right') then
    player.x = player.x + 5
  end

  if player.y + player.height >= 800 then
    player.ySpeed = -1000
  end

  if player.y < 0 then
    player.ySpeed = 1000
  end

  if player.y > 810 then
    gameOver = true
  else
    gameOver = false
  end

  print(player.x)

  if player.x + player.width >= 800 then
    player.xSpeed = -1000
  elseif player.x < 0 then
    player.xSpeed = 1000
  end

end

function love.keypressed(key)

  if key == "up" then
    player.ySpeed = -800
  end

end