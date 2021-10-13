

function initializeProjectile()

  Projectile = {}

end

function initializeEnnemies()

  ennemie = {}

  ennemie.width = WIN_WIDTH/50
  ennemie.height = WIN_HEIGHT/50
  ennemie.x = WIN_WIDTH/10
  ennemie.y = WIN_HEIGHT/2

end

function initializePerso()



  Perso = {}

  Perso.speedX = 400
  Perso.speedY = 400
  Perso.width = WIN_WIDTH/35
  Perso.height = WIN_WIDTH/35
  Perso.x = WIN_WIDTH/2 - Perso.width/2
  Perso.y = WIN_HEIGHT/2 - Perso.height/2
  Perso.heat = 0
  Perso.heatp = 0.2


end

function love.load()

  initializePerso()
  initializeEnnemies()
  initializeProjectile()

  Canon = love.graphics.newImage("images/Canon.png")

  --Canon_width = 50
  --Canon_height = 20


end

function love.update(dt)


  y = love.mouse.getY() 
  x = love.mouse.getX()

  angle = math.atan2(y - Perso.y, x - Perso.x)


  --Deplacement
  if love.keyboard.isDown('a', 'left') then
    Perso.x = Perso.x - (Perso.speedX*dt)
  elseif love.keyboard.isDown('d' , 'right') then
    Perso.x = Perso.x + (Perso.speedX*dt)
  end

  if love.keyboard.isDown('w', 'up') then
    Perso.y = Perso.y - (Perso.speedY*dt)
  elseif love.keyboard.isDown('s', 'down') then
    Perso.y = Perso.y + (Perso.speedY*dt)
  end

  --Shooting

  if love.mouse.isDown('1') and Perso.heat <= 0 then
    local direction = math.atan2(y - Perso.y, x - Perso.x)
    table.insert(Projectile, {
        px = Perso.x,
        py = Perso.y,
        dir = direction,
        speed = 500,
      })

    Perso.heat = Perso.heatp
  end

  Perso.heat = math.max(0, Perso.heat - dt)

  -- update bullets:
  for i, o in ipairs(Projectile) do
    o.px = o.px + math.cos(o.dir) * o.speed * dt
    o.py = o.py + math.sin(o.dir) * o.speed * dt
  end

  -- clean up out-of-screen bullets:
  for i = #Projectile, 1, -1 do
    local o = Projectile[i]
    if (o.px < -10) or (o.px > love.graphics.getWidth() + 10)
    or (o.py < -10) or (o.py > love.graphics.getHeight() + 10) then
      o.speed = -500/1 --Pour faire rebondir les projectiles
    end
  end
  -- Collision



end

function love.draw()

  love.graphics.setColor(255,255,255)
  love.graphics.draw(Canon,Perso.x,Perso.y,angle,1,1,0,10)
  love.graphics.print(angle,0,0)


  love.graphics.setColor(255,255,255)
  love.graphics.circle('fill', Perso.x,  Perso.y, Perso.width,  Perso.height)
  love.graphics.setColor(255,0,0)
  love.graphics.line(Perso.x,Perso.y, x,y)

  if math.sqrt((Perso.x - x)^2 + (Perso.y - y)^2) > 200 then

    love.graphics.setColor(255,255,0)
    love.graphics.line(Perso.x,Perso.y, x,y)
    
    
    -- draw bullets:
    love.graphics.setColor(255, 255, 255, 224)
    for i, o in ipairs(Projectile) do
      love.graphics.circle('fill', o.px, o.py, 10, 8)
    end

  else
    love.graphics.setColor(255,0,0)
    for i, o in ipairs(Projectile) do
      love.graphics.circle('fill', o.px, o.py, 10, 8)
      love.graphics.draw(Canon,Perso.x,Perso.y,angle,1,1,0,10)
      love.graphics.circle('fill', Perso.x,  Perso.y, Perso.width,  Perso.height)
    end

  end







end

function love.mousemoved()

end

function love.keypressed(key)

  if key == "escape" then
    love.event.quit() -- Pour quitter le jeu
  end

  if key == "e" then
    print("test")
  end

end
