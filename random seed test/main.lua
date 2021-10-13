

function love.load()
  random = 0
end

function love.update()
  love.timer.sleep(0.2)
  random = math.random(os.time())
end

function love.draw()
  
  love.graphics.print(random)
  
end
