
function love.load()

  like = {
    number = 39000
  }
  dislike = {
    number = 1000
  }

  bar = {
    x = WIN_WIDTH/2,
    y = WIN_HEIGHT/2,
    width = 450,
    height = 17
  }


end

function love.update(dt)
  total_vote = like.number + dislike.number
  
  if love.keyboard.isDown('up') then
    like.number = like.number + 1
  elseif love.keyboard.isDown('down') then
    dislike.number = dislike.number + 1
  end

  lenght_for_vote = bar.width/total_vote
  lenght_like = lenght_for_vote*like.number
  lenght_dislike = lenght_for_vote*dislike.number

  if lenght_dislike + lenght_like ~= bar.width then

  end

end

function love.draw()

  love.graphics.setColor(200,200,200)

  love.graphics.rectangle('fill', bar.x - bar.width/2, bar.y - bar.height/2, bar.width, bar.height)

  love.graphics.setColor(0,255,0)

  for i = 0, like.number do
    love.graphics.rectangle('fill',bar.x - bar.width/2,bar.y - bar.height/2, lenght_for_vote*i, bar.height)
  end
  love.graphics.print(like.number, ((bar.x - bar.width/2) - 10) + lenght_like/2, bar.y + 10)
  love.graphics.print("("..math.ceil((100/total_vote)*like.number).."%"..")", ((bar.x - bar.width/2) - 10) + lenght_like/2, bar.y + 25)
  
  love.graphics.setColor(255,0,0)

  for i = 0, dislike.number do
    love.graphics.rectangle('fill',(bar.x - bar.width/2) + lenght_like ,bar.y - bar.height/2, lenght_for_vote*i, bar.height)
  end
  love.graphics.print(dislike.number, ((bar.x - bar.width/2) + lenght_like - 10) + lenght_dislike/2, bar.y + 10)
  love.graphics.print("("..math.floor((100/total_vote)*dislike.number).."%"..")", ((bar.x - bar.width/2) + lenght_like - 10) + lenght_dislike/2, bar.y + 25)

  love.graphics.setColor(255,255,255)
  
  --love.graphics.line((bar.x - bar.width/2) + lenght_like,bar.y,(bar.x - bar.width/2) + lenght_like,0)
  
end
