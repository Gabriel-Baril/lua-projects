
--Pour un graphique egal le modulo entre WIN_WIDTH et sep_line doit etre egal a 0
local sep_line = 20
local myColor = {0,255,0}

function initializePerso()
  
  Perso = {}
  
  Perso.x = 0
  Perso.y = 0
  Perso.width = sep_line
  Perso.height = sep_line
  
end

function love.load()
 initializePerso()
end

function love.update()
  
  if love.keyboard.isDown('d','right') and Perso.x + sep_line < WIN_WIDTH then
    Perso.x = Perso.x + sep_line
  end
  
  if love.keyboard.isDown('a','left') and Perso.x > 0 then
    Perso.x = Perso.x - sep_line
  end
  
  if love.keyboard.isDown('w','up') and Perso.y > 0 then
    Perso.y = Perso.y - sep_line
  end
  
  if love.keyboard.isDown('s','down') and Perso.y + sep_line < WIN_HEIGHT then
    Perso.y = Perso.y + sep_line
  end
  
  
end

function love.draw()
  
  love.graphics.rectangle('fill', Perso.x,Perso.y,Perso.width,Perso.height)

  love.graphics.setColor(255,0,0)
  love.graphics.line(0,WIN_HEIGHT/2,800,WIN_HEIGHT/2)
  love.graphics.line(WIN_WIDTH/2,0,WIN_WIDTH/2,800)
  love.graphics.print("0", WIN_WIDTH/2,WIN_HEIGHT/2)
  love.graphics.setColor(0,255,0)
  love.graphics.print(tostring(love.timer.getFPS()),0,0)
  love.graphics.setColor(255,255,255)
  

  for  i = 1, WIN_HEIGHT/sep_line, 1 do
    for j = 1, WIN_WIDTH/sep_line, 1 do
    
    
    love.graphics.line(0,WIN_HEIGHT/2 + i*sep_line,800,WIN_HEIGHT/2 + i*sep_line)
    love.graphics.line(0,WIN_HEIGHT/2 + -i*sep_line,800,WIN_HEIGHT/2 + -i*sep_line)
    
    love.graphics.print(i,WIN_HEIGHT/2,WIN_HEIGHT/2 + -i*sep_line)
    love.graphics.print(-i,WIN_HEIGHT/2,WIN_HEIGHT/2 + i*sep_line)

    
    love.graphics.line(WIN_WIDTH/2 + j*sep_line,0,WIN_WIDTH/2 + j*sep_line,800)
    love.graphics.line(WIN_WIDTH/2 + -j*sep_line,0,WIN_WIDTH/2 -j*sep_line,800)
    
    love.graphics.print(i,WIN_WIDTH/2 + i*sep_line,WIN_WIDTH/2)
    love.graphics.print(-i,WIN_WIDTH/2 + -i*sep_line,WIN_WIDTH/2)

    end
  end

  
end




function love.mousemoved()
  
end

function love.mousepressed()
  
end

function love.keypressed()
  
end