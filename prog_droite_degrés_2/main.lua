
function parabole()
  
end

function love.load()
  
  sep_line = 20
  
  radiusy = WIN_HEIGHT/2
  radiusx = 100
  x = WIN_WIDTH/2
  y = WIN_HEIGHT/2
  
  if rotation == true then
    radiusx = radiusy
    radiusy = radiusx
  end

 
end

function love.update(dt)

  
end

function love.draw()
  
  love.graphics.print(love.timer.getFPS())
  
  love.graphics.setColor(255,0,0)
  love.graphics.line(WIN_WIDTH/2,0,WIN_WIDTH/2,WIN_HEIGHT)
  love.graphics.line(0,WIN_HEIGHT/2,WIN_WIDTH,WIN_HEIGHT/2)
  love.graphics.setColor(255,255,255)
  
  love.graphics.ellipse("line", x, y  - radiusy, radiusx, radiusy, 1000)  
  
end




function love.mousemoved()
  
end

function love.mousepressed()
  
end

function love.keypressed()
  
end