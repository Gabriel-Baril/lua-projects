player = {
	x = 100,
	y = 100,
	speed = 200,
	heat = 0,
	heatp = 0.1
}

bullets = {}
 
function love.update(dt)
	if love.keyboard.isDown('a') then player.x = player.x - dt * player.speed end
	if love.keyboard.isDown('d') then player.x = player.x + dt * player.speed end
	if love.keyboard.isDown('w') then player.y = player.y - dt * player.speed end
	if love.keyboard.isDown('s') then player.y = player.y + dt * player.speed end
	-- shooting:
	if love.mouse.isDown('1') and player.heat <= 0 then
		local direction = math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
		table.insert(bullets, {
			x = player.x,
			y = player.y,
			dir = direction,
			speed = 400
		})
		player.heat = player.heatp
	end
	player.heat = math.max(0, player.heat - dt)
	-- update bullets:
    for i, o in ipairs(bullets) do
        o.x = o.x + math.cos(o.dir) * o.speed * dt
        o.y = o.y + math.sin(o.dir) * o.speed * dt
    end
	-- clean up out-of-screen bullets:
	for i = #bullets, 1, -1 do
        local o = bullets[i]
        if (o.x < -10) or (o.x > love.graphics.getWidth() + 10)
        or (o.y < -10) or (o.y > love.graphics.getHeight() + 10) then
            table.remove(bullets, i)
        end
    end
end
 
function love.draw()
	-- draw player:
	love.graphics.setColor(255, 255, 255, 224)
	love.graphics.circle('fill', player.x, player.y, 15, 8)
	-- draw bullets:
	love.graphics.setColor(255, 255, 255, 224)
	for i, o in ipairs(bullets) do
		love.graphics.circle('fill', o.x, o.y, 10, 8)
	end
end
 
function love.load()
	love.graphics.setBackgroundColor(50, 75, 125)
end
