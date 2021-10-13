
Object = {
  
  x = 0,
  y = 0,
  width = 32,
  height = 0
  
}


function Object:new()
  obj = {}
  
  obj.x = Object.x
  obj.y = Object.y
  obj.width = Object.width
  obj.height = Object.height
  
  return obj
end



Object:new()

