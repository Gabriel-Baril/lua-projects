

function love.load()
  
  isaacHead = love.graphics.newImage("images/Isaac_head_front_open_eyes.png")
  isaacHeadX = 0
  isaacHeadY = 0
 
  isaacBodyFront = love.graphics.newImage("images/Isaac_walk_sprite_1.png")
  
  enemy = {x = 500, y = 400, width = 20, height = 20}
  
  
end

function love.update(dt)
  
  isaacBodyX = isaacHeadX + 5
  isaacBodyY = isaacHeadY + 20
  
  isaacHead = love.graphics.newImage("images/Isaac_head_front_open_eyes.png")
  
  if love.keyboard.isDown('left') then
    isaacHead = love.graphics.newImage("images/Isaac_head_left_open_eyes.png")
    
    isaacHeadX = isaacHeadX - 4
  end
  
  if love.keyboard.isDown('right') then
    isaacHead = love.graphics.newImage("images/Isaac_head_right_open_eyes.png")
    isaacHeadX = isaacHeadX + 4
  end
  
  if love.keyboard.isDown('up') then
    isaacHead = love.graphics.newImage("images/Isaac_head_back_open_eyes.png")
    isaacHeadY = isaacHeadY - 4
  end
  
  if love.keyboard.isDown('down') then
    isaacHead = love.graphics.newImage("images/Isaac_head_front_open_eyes.png")
    isaacHeadY = isaacHeadY + 4
  end
  
  if enemy.y > isaacBodyY then
    enemy.y = enemy.y - 1
  end
  
  if enemy.y < isaacBodyY then
    enemy.y = enemy.y + 1
  end
  
  if enemy.x > isaacBodyX then
    enemy.x = enemy.x - 1
  end
  
  if enemy.x < isaacBodyX then
    enemy.x = enemy.x + 1
  end
  
  if enemy.x < isaacBodyX + 18 and
   enemy.x + enemy.width > isaacBodyX and
   enemy.y < isaacBodyY + 15 and
   enemy.height + enemy.y > isaacBodyY then
     
     love.event.quit()
     
  end

  
end

function love.draw()
  
  love.graphics.setColor(255,0,0)
  love.graphics.rectangle("fill",enemy.x,enemy.y,enemy.width,enemy.height)
  
  love.graphics.setColor(255,255,255)
  love.graphics.draw(isaacBodyFront,isaacBodyX,isaacBodyY)
  love.graphics.draw(isaacHead,isaacHeadX,isaacHeadY)
  
end

function love.keypressed(key)
end
  
