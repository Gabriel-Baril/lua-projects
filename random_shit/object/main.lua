
Object = {
  
  x = 0,
  y = 0,
  width = 0,
  height = 0
  
}


function Object:new(x,y,width,height)
  obj = {}
  
  obj.x = x
  obj.y = y
  obj.width = width
  obj.height = height
  
  return obj
end

function Object:draw(obj)
  x, y, width, height
  print(x,y,width,height)
end



Object:new(50,50,20,20)


function love.update()
  
  Object:draw(50,50,20,20)
end

function love.draw()
end




function love.mousemoved()
  
end

function love.mousepressed()
  
end

function love.keypressed()
  
end