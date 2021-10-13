
Object = {
  x = 0,
  y = 0,
  width = 0,
  height = 0,
  name = "",

  New = function()
    local object = {}

    object.x = Object.x
    object.y = Object.y
    object.width = Object.width
    object.height = Object.height
    object.name = Object.name

    return object
  end

}

function Object:new(x,y,name)

  object = {}
  object.x = x
  object.y = y
  object.name = name

  return object
end

function love.update()
  
  Object:new(50,70,"obj_1")
  Object:new(30,45,"obj_2")
  
  if object.name == "obj_1" then
    print(object.x)
    print(object.y)
  end
  
end

function love.draw()
end
