
local time = love.timer.getTime()

function love.load()
 
end

function love.update(dt)
  
end

function love.draw()
  
  --love.graphics.line(0,WIN_HEIGHT/2,800,WIN_HEIGHT/2)
  --love.graphics.polygon('fill',WIN_HEIGHT/2,WIN_WIDTH/2,0,0,800,0,700,600)
  --love.graphics.circle('fill',50,50,10)
  --love.graphics.pop()
  love.graphics.push()   -- stores the coordinate system
   love.graphics.scale(0.5, 0.5)   -- reduce everything by 50% in both X and Y coordinates
   love.graphics.print("Scaled text", 50, 50)   -- print half-sized text at 25x25
   love.graphics.pop()   -- return to stored coordinated
   love.graphics.print("Normal text", 50, 50)

end




function love.mousemoved()
  
end

function love.mousepressed()
  
end

function love.keypressed()
  
end