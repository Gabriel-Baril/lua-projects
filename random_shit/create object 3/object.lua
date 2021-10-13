
Object = {
  
  x = 0,
  y = 0,
  width = 32,
  height = 0,
  
  attribute = function(self)
    print(self.x, self.y, self.width, self.height)
  end
  
}

local rect = Object
rect.x = 20
rect.y = 50
rect.width = 25
rect.height = 35

local data = Object
rect.x = 100
rect.y = 75
rect.width = 40
rect.height = 40



Object.attribute(rect)

