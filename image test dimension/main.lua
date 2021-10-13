

function love.load()
  
  heart = love.graphics.newImage("images/full_red_heart.png")
  
end

function love.update()
  
end

function love.draw()
  
  
  love.graphics.rectangle('fill',0,0,100,20)
  love.graphics.scale(3,3)
  love.graphics.draw(heart)
  
  love.graphics.draw(heart,12)
  
  love.graphics.draw(heart,24)
  
  
end




function love.mousemoved()
  
end

function love.mousepressed()
  
end

function love.keypressed()
  
end