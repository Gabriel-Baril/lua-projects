

function transform_invs(a)
  return -a
end


function droite(ord_org,pente,id) -- Fonction qui permet de creer des droites comme on veut

  ord_origin = transform_invs(ord_org)
  pente = transform_invs(pente)
  abs_origin = -(ord_origin/pente)

  if ord_origin < 0 then
    abs_origin_up_page = (WIN_HEIGHT/2 + ord_origin)/pente
  elseif ord_origin > 0 then
    abs_origin_up_page = (WIN_HEIGHT/2 - ord_origin)/pente
  elseif ord_origin == 0 then
    abs_origin_up_page = (WIN_HEIGHT/2)/pente
  end

  if ord_origin < 0 then
    abs_origin_down_page = ((-WIN_HEIGHT/2) + ord_origin)/pente
  elseif ord_origin > 0 then
    abs_origin_down_page = ((-WIN_HEIGHT/2) - ord_origin)/pente
  elseif ord_origin == 0 then
    abs_origin_down_page = (-WIN_HEIGHT/2)/pente
  end


  -- Boucle qui s'occupe de la droite si son ordonné a l'origine est positive
  if ord_origin <= 0 then

    love.graphics.line(WIN_WIDTH/2 + abs_origin,WIN_HEIGHT/2, WIN_WIDTH/2 + -abs_origin_down_page, WIN_HEIGHT) -- ligne du bas jusqu'a l'abssice à l'origine
    love.graphics.line(WIN_WIDTH/2 + abs_origin,WIN_HEIGHT/2,WIN_WIDTH/2,WIN_HEIGHT/2 + ord_origin) -- ligne de l'abssice à l'origine jusqu'a l'ordonné à l'origine
    love.graphics.line(WIN_WIDTH/2,WIN_HEIGHT/2 + ord_origin, WIN_WIDTH/2 + -abs_origin_up_page,0) -- ligne de l'ordonné à l'origine jusqu'a la ligne du haut

    love.graphics.print("d"..id,WIN_WIDTH/2 - abs_origin_up_page,0)
    
    print(transform_invs(ord_origin))
    print(transform_invs(pente))

  end
  -- fin boucle

  -- Boucle qui s'occupe de la droite si son ordonné a l'origine est négative
  if ord_origin > 0 then

    love.graphics.line(WIN_WIDTH/2 + abs_origin_up_page,WIN_HEIGHT, WIN_WIDTH/2,WIN_HEIGHT/2 + ord_origin) 
    love.graphics.line(WIN_WIDTH/2,WIN_HEIGHT/2 + ord_origin,WIN_WIDTH/2 + abs_origin,WIN_HEIGHT/2)
    love.graphics.line(WIN_WIDTH/2 + abs_origin,WIN_HEIGHT/2, WIN_WIDTH/2 + abs_origin_down_page,0)

    love.graphics.print("d"..id,(WIN_WIDTH/2 - abs_origin_up_page) + abs_origin*2,0)

  end
  -- fin boucle


end

function love.load()

  font_number = love.graphics.newFont(10)

  SETTING_PAGE = 0
  GRAPHICS_PAGE = 1
  STAT_PAGE = 2

  page = GRAPHICS_PAGE

  scale = false
  nb_point = 0

  sep_line_x = 50 -- Détermine le bond en abssice à chaque abssice + 1
  sep_line_y = 50 -- Détermine le bond en ordonné à chaque ordonné + 1

  msr_sqrt_x = WIN_WIDTH/sep_line_x
  msr_sqrt_y = WIN_HEIGHT/sep_line_y

  vision_x_line = false
  vision_y_line = false
  vision_droite = false


  nb_sqrt_quadrant = (((WIN_WIDTH/sep_line_x)/2)*((WIN_HEIGHT/sep_line_y)/2))
  total_nb_sqrt_quadrant = nb_sqrt_quadrant*4

  surface_sqrt = msr_sqrt_x*msr_sqrt_y
  surface_sqrt_quadrant = nb_sqrt_quadrant*surface_sqrt
  total_surface_sqrt_quadrant = surface_sqrt_quadrant*4
  
  

end

function love.update(dt)

  mouse_X = love.mouse.getX()
  mouse_Y = love.mouse.getY()

  if love.keyboard.isDown('1') then
    vision_x_line = true
  else
    vision_x_line = false
  end

  if love.keyboard.isDown('2') then
    vision_y_line = true
  else
    vision_y_line = false
  end

  if love.keyboard.isDown('3') then
    vision_droite = true
  else
    vision_droite = false
  end

  if love.keyboard.isDown('z') then
    scale = true
  else
    scale = false
  end


end

function love.draw()
  
  if page == SETTING_PAGE then
    
    
    
  end

  if page == GRAPHICS_PAGE then

    if scale then
      love.graphics.scale(2,2)
      love.graphics.translate(-mouse_X/2,-mouse_Y/2)
    else
      love.graphics.scale(1,1)
    end

    love.graphics.setFont(font_number)

    love.graphics.setColor(255,0,0)
    love.graphics.line(WIN_WIDTH/2, 0, WIN_WIDTH/2 ,WIN_HEIGHT)
    love.graphics.line(0, WIN_HEIGHT/2, WIN_WIDTH,WIN_HEIGHT/2)
    love.graphics.setColor(255,255,255)

    love.graphics.print(0,WIN_WIDTH/2 - 3.5,WIN_HEIGHT/2)

    for i = 1, WIN_WIDTH/sep_line_x do
      if vision_x_line then
        love.graphics.setColor(255,255,0)
        love.graphics.line(WIN_WIDTH/2 + sep_line_x*i,0,WIN_WIDTH/2 + sep_line_x*i,WIN_HEIGHT)
        love.graphics.line(WIN_WIDTH/2 + sep_line_x*-i,0,WIN_WIDTH/2 + sep_line_x*-i,WIN_HEIGHT)
        love.graphics.setColor(255,255,255)
      else
        love.graphics.line(WIN_WIDTH/2 + sep_line_x*i,0,WIN_WIDTH/2 + sep_line_x*i,WIN_HEIGHT)
        love.graphics.line(WIN_WIDTH/2 + sep_line_x*-i,0,WIN_WIDTH/2 + sep_line_x*-i,WIN_HEIGHT)
      end

      love.graphics.print(sep_line_x*i, WIN_WIDTH/2 + i*sep_line_x - 12, WIN_HEIGHT/2)
      love.graphics.print(sep_line_x*-i, WIN_WIDTH/2 + -i*sep_line_x - 8, WIN_HEIGHT/2)


    end

    for j = 1, WIN_HEIGHT/sep_line_y do
      if vision_y_line then
        love.graphics.setColor(0,255,255)
        love.graphics.line(0,WIN_HEIGHT/2 + sep_line_y*j,WIN_WIDTH, WIN_HEIGHT/2 + sep_line_y*j)
        love.graphics.line(0,WIN_HEIGHT/2 + sep_line_y*-j,WIN_WIDTH, WIN_HEIGHT/2 + sep_line_y*-j)
        love.graphics.setColor(255,255,255)
      else
        love.graphics.line(0,WIN_HEIGHT/2 + sep_line_y*j,WIN_WIDTH, WIN_HEIGHT/2 + sep_line_y*j)
        love.graphics.line(0,WIN_HEIGHT/2 + sep_line_y*-j,WIN_WIDTH, WIN_HEIGHT/2 + sep_line_y*-j)
      end

      love.graphics.print(sep_line_y*-j, WIN_WIDTH/2 , WIN_HEIGHT/2 + j*sep_line_y - 2)
      love.graphics.print(sep_line_y*j, WIN_WIDTH/2 , WIN_HEIGHT/2 + -j*sep_line_y - 2)

    end

    droite(400,2,"1")
    
  end

end




function love.mousemoved()

end

function love.mousepressed()

end

function love.keypressed()

end