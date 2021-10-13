

function love.load()
  playerIMG = love.graphics.newImage("images/perso.png")
  
  player_x = WIN_WIDTH/2 --position de limage en x
  player_y = WIN_HEIGHT/2 --position de limage en y
  speed = 100 --vitesse de deplacement du personnage
  player_Height = 20 --hauteur du personnage
  player_Width = 50 --largeur du personnage
 
end

function love.update(dt)
  mouse_X = love.mouse.getX()
  mouse_Y = love.mouse.getY()
  
  angle = math.atan2(mouse_Y - player_y, mouse_X - player_x)
  

end

function love.draw()
  
  love.graphics.draw(playerIMG,player_x,player_y,angle,1,1,player_Width/2,player_Height/2)
  
  
end
