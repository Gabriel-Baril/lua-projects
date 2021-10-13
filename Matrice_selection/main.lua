

function love.load()
 
 
 
 sol = {x = 0, y = 600, width = WIN_WIDTH, height = WIN_HEIGHT - 600}
 perso = {x = 300, y = 570, width = 20, height = 30, jump = false, speedX = 250, speedY = 200}
 
end

function love.update(dt)
  
  
  
 
  
  
end

function love.draw()
  
  
  love.graphics.rectangle('fill', perso.x, perso.y , perso.width, perso.height)
  love.graphics.setColor(100,255,100)
  love.graphics.print(perso.y)
  love.graphics.rectangle('fill', sol.x, sol.y, sol.width, sol.height)
  love.graphics.setColor(0,0,255)
  
end




function love.mousemoved()
  
end

function love.mousepressed()
  
end

function love.keypressed()
  
end