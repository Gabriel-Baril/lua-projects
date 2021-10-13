
local racket -- Déclaration variable pour la raquette
local bricks -- Déclaration variable pour les briques
local lives -- Déclaration variable pour les vies
local ball -- Déclaration variable pour la balle
local nbBricks = BRICKS_PER_COLUMN * BRICKS_PER_LINE
local soundBrick
local soundRacket
local font
currentPage = PAGE_BEGINNING

function updateRound(dt)
  
   if love.keyboard.isDown('left', 'a') and racket.x > 0 then
      racket.x = racket.x - (racket.speedX*dt)
      
      
  elseif love.keyboard.isDown('right', 'd') and racket.x + racket.width <    WIN_WIDTH then
      racket.x = racket.x + (racket.speedX*dt)
     
  end
  
  if ball.x + ball.width >= WIN_WIDTH then
    ball.speedX = -ball.speedX
  elseif ball.x <= 0 then
    ball.speedX = -ball.speedX
  end
  
  if ball.y <= 0 then
    ball.speedY = -ball.speedY
  elseif ball.y + ball.height >= WIN_HEIGHT then
    lives.count = lives.count - 1
    resetBall(racket.y)
    
    if lives.count == 0 or nbBricks == 0 then
      currentPage = PAGE_END -- Page de fin
    end
  end
  
  ball.x = ball.x + ball.speedX * dt
  ball.y = ball.y + ball.speedY * dt
  
  if collideRect(ball, racket) then
    
    collisionBallWithRacket() -- Collision entre la balle et la raquette
    
  end
  
  for line = #bricks, 1, -1 do
    for column = #bricks[line], 1, -1 do
      if bricks[line][column].isNotBroken and collideRect(ball, bricks[line][column]) then
        collisionBallWithBrick(ball, bricks[line][column])
      end
    end
  end
  
end

function drawRound()
  
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle('fill', racket.x, racket.y, racket.width, racket.height)
  
  for line=1, #bricks do -- Ligne
    for column=1, #bricks[line] do -- Colonne
    local brick = bricks[line][column]
    if brick.isNotBroken then -- Si la brique n'est pas cassée
    love.graphics.rectangle('fill', brick.x, brick.y, brick.width,     brick.height) -- Rectangle
    
      end 
    end
  end
  
  for i=0, lives.count-1 do -- Pour chaque vie
    local posX = 5 + i * 1.20 * lives.width -- Calcul de la position en abscisse
    love.graphics.draw(lives.img, posX, WIN_HEIGHT-lives.height) -- Affichage de l'image
  end
  
  love.graphics.rectangle('fill', ball.x, ball.y, ball.width, ball.height)--ball
  
  
end

function resetRacket()
  racket.x = (WIN_WIDTH-racket.width) / 2 -- Position en abscisse
  racket.y = WIN_HEIGHT - 64 -- Position en ordonnée
end

function collideRect(rect1, rect2)
  if rect1.x < rect2.x + rect2.width and
     rect1.x + rect1.width > rect2.x and
     rect1.y < rect2.y + rect2.height and
     rect1.height + rect1.y > rect2.y then
       return true
  end
  return false
end

function collisionBallWithBrick(ball, brick)
  
  --soundBrick:play()
  
  if ball.x < brick.x and ball.speedX > 0 then
    ball.speedX = -ball.speedX
    
  elseif ball.x > brick.x + brick.width and ball.speedX < 0 then
    ball.speedX = -ball.SpeedX
  end
  
  if ball.y < brick.y and ball.speedY > 0 then
    ball.speedY = -ball.speedY
  elseif ball.y > brick.y and ball.speedY < 0 then
    ball.speedY = -ball.speedY
  end
  
  brick.isNotBroken = false
  nbBricks = nbBricks - 1
  
end

function collisionBallWithRacket()
  
  --soundRacket:play()

    -- Collision par la gauche (coin haut inclus)
    if ball.x < racket.x + 1/8 * racket.width and ball.speedX >= 0 then
      if ball.speedX <= DEFAULT_SPEED_BX/2 then -- Si vitesse trop faible
        ball.speedX = -math.random(0.75*DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Nouvelle vitesse
      else
        ball.speedX = -ball.speedX
      end
    -- Collision par la droite (coin haut inclus)
    elseif ball.x > racket.x + 7/8 * racket.width and ball.speedX <= 0 then
      if ball.speedX >= -DEFAULT_SPEED_BX/2 then  -- Si vitesse trop faible
        ball.speedX = math.random(0.75*DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Nouvelle vitesse
      else 
        ball.speedX = -ball.speedX
      end
    end
    -- Collision par le haut
    if ball.y < racket.y and ball.speedY > 0 then
      ball.speedY = -ball.speedY
  end

end

function resetBall(racketY)
  ball.speedY = -DEFAULT_SPEED_BY
  ball.speedX = math.random(-DEFAULT_SPEED_BX, DEFAULT_SPEED_BY) 
  ball.x = WIN_WIDTH / 2 - ball.width / 2
  ball.y = racketY - 2 * ball.height - ball.height / 2
  
end

function createBrick(line, column)

  local brick = {}
  
  brick.isNotBroken = true -- Brique pas encore cassée
  brick.width = WIN_WIDTH / BRICKS_PER_LINE - 5 -- Largeur
  brick.height = WIN_HEIGHT / 35 -- Hauteur
  brick.x = 2.5 + (column-1) * (5+brick.width) -- Position en abscisse
  brick.y = line * (WIN_HEIGHT/35+2.5) -- Position en ordonnée
  
  return brick

end

function initializeBricks()

    bricks = {} -- Initialisation variable pour les briques
    
    for line = 1, BRICKS_PER_COLUMN do
      table.insert(bricks, {}) -- Ajout d'une ligne
      for column = 1, BRICKS_PER_LINE do
        local brick = createBrick(line, column)
        table.insert(bricks[line], brick) 
        
      end
    end

end

function initializeLives()
  
  lives = {}
  lives.count = NB_LIVES
  lives.img = love.graphics.newImage(PATH_LIVE)
  lives.width, lives.height = lives.img:getDimensions()
  
end

function initializeBall(racketHeight, racketY)
  
  ball = {}
  
  ball.width, ball.height = racketHeight * 0.75, racketHeight * 0.75  -- Taille
  ball.speedY = -DEFAULT_SPEED_BY -- Vitesse verticale
  ball.speedX = math.random(-DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Vitesse horizontale
  ball.x = WIN_WIDTH / 2 - ball.width / 2 -- Position en abscisse
  ball.y = racketY - 2 * ball.height - ball.height / 2 -- Position en ordonnée


  
end

function initializeRacket()

  racket = {} -- Initialisation variable pour la raquette

  
  racket.speedX = 215 -- Vitesse horizontale
  racket.width = WIN_WIDTH / 4 -- Largeur
  racket.height = WIN_HEIGHT / 37 -- Hauteur
  racket.x = (WIN_WIDTH-racket.width) / 2 -- Position en abscisse
  racket.y = WIN_HEIGHT - 64 -- Position en ordonnée

end

function love.load()
  
  initializeRacket()
  initializeBricks()
  initializeBall(racket.height, racket.y)
  initializeLives()
  
  math.randomseed(love.timer.getTime()) 
  
  --soundBrick = love.audio.newSource(PATH_SOUND_BRICK, "static")
  --soundRacket = love.audio.newSource(PATH_SOUND_RACKET, "static")
  
  font = love.graphics.newFont(32)
  love.graphics.setFont(font)
  
end

function love.update(dt)
  
  
  if currentPage == PAGE_BEGINNING then
    
  elseif currentPage == PAGE_ROUND then
  
  updateRound(dt)
  
  elseif currentPage == PAGE_END then
  
  end

end

function love.draw()

  if currentPage == PAGE_BEGINNING then
    
    love.graphics.printf("Casse-briques", 0, 0.25*WIN_HEIGHT, WIN_WIDTH,    "center") -- Écriture
love.graphics.printf("Appuyez sur 'R' pour commencer", 0, 0.45*WIN_HEIGHT, WIN_WIDTH, "center")
    
  elseif currentPage == PAGE_ROUND then
    
    drawRound()
  
  
  elseif currentPage == PAGE_END then
  
    local message = "Victoire !"
    if lives.count == 0 then
      message = "Défaite !"
    end
    love.graphics.printf(message, 0, 0.25*WIN_HEIGHT, WIN_WIDTH, "center") --  
    
      love.graphics.printf("Appuyez sur 'R' pour recommencer", 0, 0.45*WIN_HEIGHT, WIN_WIDTH, "center")

  end

end

function love.keypressed(key)
  
  if key == "r" then
    if currentPage ~= PAGE_BEGINNING then
      
      resetRacket() -- Réinitialisation de la raquette

    -- Réinitialisation des briques
    for line=1, #bricks do
      for column=1, #bricks[line] do
        bricks[line][column].isNotBroken = true
      end
    end

    lives.count = NB_LIVES -- Réinitialisation des vies
    nbBricks = BRICKS_PER_COLUMN * BRICKS_PER_LINE -- Réinitialisation du nombre de briques
    resetBall(racket.y) -- Réinitialisation de la balle
      
    
  end
  
  currentPage = PAGE_ROUND -- Page jeu

end

  if key == "escape" then
    love.event.quit() -- Pour quitter le jeu
  end

end