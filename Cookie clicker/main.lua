
function collisionCursWithCookie()

  if mouse_X >= Cookie.x - Cookie.width/2 and
  mouse_X < Cookie.x + Cookie.width and
  mouse_Y >= Cookie.y - Cookie.height/2 and
  mouse_Y < Cookie.y + Cookie.height then
    mouse_on_cookie = true
  else
    mouse_on_cookie = false
  end

end


function collisionCursWithButtonPlay()

  if mouse_X >= buttonPlay.x and
  mouse_X < buttonPlay.x  + buttonPlay.width and
  mouse_Y >= buttonPlay.y and
  mouse_Y < buttonPlay.y  + buttonPlay.height then
    Hover_Button_Play = true
  else
    Hover_Button_Play = false
  end

end

function collisionCursWithButtonSetting()

  if mouse_X >= buttonSetting.x and
  mouse_X < buttonSetting.x  + buttonSetting.width and
  mouse_Y >= buttonSetting.y and
  mouse_Y < buttonSetting.y  + buttonSetting.height then
    Hover_Button_Setting = true
  else
    Hover_Button_Setting = false
  end

end

function collisionCursWithButtonExit()

  if mouse_X >= buttonExit.x and
  mouse_X < buttonExit.x  + buttonExit.width and
  mouse_Y >= buttonExit.y and
  mouse_Y < buttonExit.y  + buttonExit.height then
    Hover_Button_Exit = true
  else
    Hover_Button_Exit = false
  end

end

function collisionCursWithButtonGoToUpg()

  if mouse_X >= buttonGoToUpg.x and
  mouse_X < buttonGoToUpg.x  + buttonGoToUpg.width and
  mouse_Y >= buttonGoToUpg.y and
  mouse_Y < buttonGoToUpg.y  + buttonGoToUpg.height then
    Hover_Button_Go_To_Upg = true
  else
    Hover_Button_Go_To_Upg = false
  end

end

function collisionCursWithButtonExitUpg()

  if mouse_X >= buttonExitUpg.x and
  mouse_X < buttonExitUpg.x  + buttonExitUpg.width and
  mouse_Y >= buttonExitUpg.y and
  mouse_Y < buttonExitUpg.y  + buttonExitUpg.height then
    Hover_Button_Exit_Upg = true
  else
    Hover_Button_Exit_Upg = false
  end

end

function collisionCursWithButtonStat()

  if mouse_X >= buttonStat.x and
  mouse_X < buttonStat.x  + buttonStat.width and
  mouse_Y >= buttonStat.y and
  mouse_Y < buttonStat.y  + buttonStat.height then
    Hover_Button_stat = true
  else
    Hover_Button_stat = false
  end

end

function collisionCursWithButtonUpg1()

  if mouse_X >= buttonUpg1.x and
  mouse_X < buttonUpg1.x  + buttonUpg1.width and
  mouse_Y >= buttonUpg1.y and
  mouse_Y < buttonUpg1.y  + buttonUpg1.height then
    Hover_Button_Upg_1 = true
  else
    Hover_Button_Upg_1 = false
  end

end

function collisionCursWithButtonUpg2()

  if mouse_X >= buttonUpg2.x and
  mouse_X < buttonUpg2.x  + buttonUpg2.width and
  mouse_Y >= buttonUpg2.y and
  mouse_Y < buttonUpg2.y  + buttonUpg2.height then
    Hover_Button_Upg_2 = true
  else
    Hover_Button_Upg_2 = false
  end

end

function collisionCursWithButtonUpg3()

  if mouse_X >= buttonUpg3.x and
  mouse_X < buttonUpg3.x  + buttonUpg3.width and
  mouse_Y >= buttonUpg3.y and
  mouse_Y < buttonUpg3.y  + buttonUpg3.height then
    Hover_Button_Upg_3 = true
  else
    Hover_Button_Upg_3 = false
  end

end

function collisionCursWithButtonUpg4()

  if mouse_X >= buttonUpg4.x and
  mouse_X < buttonUpg4.x  + buttonUpg4.width and
  mouse_Y >= buttonUpg4.y and
  mouse_Y < buttonUpg4.y  + buttonUpg4.height then
    Hover_Button_Upg_4 = true
  else
    Hover_Button_Upg_4 = false
  end

end

function collisionCursWithButtonUpg5()

  if mouse_X >= buttonUpg5.x and
  mouse_X < buttonUpg5.x  + buttonUpg5.width and
  mouse_Y >= buttonUpg5.y and
  mouse_Y < buttonUpg5.y  + buttonUpg5.height then
    Hover_Button_Upg_5 = true
  else
    Hover_Button_Upg_5 = false
  end

end

function collisionCursWithButtonUpg6()

  if mouse_X >= buttonUpg6.x and
  mouse_X < buttonUpg6.x  + buttonUpg6.width and
  mouse_Y >= buttonUpg6.y and
  mouse_Y < buttonUpg6.y  + buttonUpg6.height then
    Hover_Button_Upg_6 = true
  else
    Hover_Button_Upg_6 = false
  end

end

function mod(a, b)
  return a - (math.floor(a/b))
end



function initializeCookie()

  Cookie = {}

  Cookie.x = WIN_WIDTH/2
  Cookie.y = WIN_HEIGHT/2
  Cookie.width = 160
  Cookie.height = 160


end



function love.load()

  initializeCookie()

  mouse_on_cookie = false
  click_on_cookie = false

  time_sec = 0
  time_min = 0
  time_hours = 0
  time_test = 0

  barTime = 120
  max_width_bar = 0
  barInConsume = false

  cookie_title_x = WIN_WIDTH/4 -- variable qui set le decalage des lettres du mot cookie pour le titre
  clicker_title_x = WIN_WIDTH/5 -- variable qui set le decalage des lettres du mot clicker pour le titre

  level_upg_1 = 0
  price_upg_1 = 10

  level_upg_2 = 0
  price_upg_2 = 25

  level_upg_3 = 0
  price_upg_3 = 150

  level_upg_4 = 0
  price_upg_4 = 500

  level_upg_5 = 0
  price_upg_5 = 10000

  level_upg_6 = 0
  price_upg_6 = 150000

  Hover_Button_Play = false
  Hover_Button_Setting = false
  Hover_Button_Exit = false
  Hover_Button_Go_To_Upg = false
  Hover_Button_stat = false

  Hover_Button_Exit_Upg = false

  Hover_Button_Upg_1 = false
  Hover_Button_Upg_2 = false
  Hover_Button_Upg_3 = false
  Hover_Button_Upg_4 = false
  Hover_Button_Upg_5 = false
  Hover_Button_Upg_6 = false

  nb_finger_click = 0

  cookie_count = 0
  cookie_max_count = 0

  cookie_per_second = 0
  cookie_per_click = 1
  cookie_per_click_mult = cookie_per_click -- Variable qui sert a determiner le nombre de cookie pendant le consume bar (on ne peut pas utiliser cookie_per_click car sinon sa va sincrementer)
  cookie_click_mult = 1

  page = BEGGINING_PAGE

  buttonPlay = {name = "Play" , x = WIN_WIDTH/2 - 100, y = WIN_HEIGHT/2 - 100, width = 200 , height = 40}
  buttonSetting = {name = "Setting" , x = WIN_WIDTH/2 - 100, y = WIN_HEIGHT/2, width = 200 , height = 40}
  buttonExit = {name = "Exit" , x = WIN_WIDTH/2 - 100, y = WIN_HEIGHT/2 + 100, width = 200 , height = 40}

  buttonGoToUpg = {name = "Upgrade", x = WIN_WIDTH - 200, y = 0, width = 200 , height = 40}
  buttonStat = {name = "Stat", x = 0, y = WIN_HEIGHT - 40, width = 200 , height = 40}


  BoostBar = {x = 50 , y = 780 , width = 500 , height = 15}
  rectBoostBar = {x = 50, y = 780, width = BoostBar.width/barTime, height = 15, consumeBar = 4}

  buttonExitUpg =  {name = "Exit", x = WIN_WIDTH - 200, y = WIN_HEIGHT - 40, width = 200 , height = 40}

  buttonUpg1 = {name = "Upgrade 1",x = 5,y = 50, width = 200 , height = 40}
  buttonUpg2 = {name = "Upgrade 2",x = 5,y = 120, width = 200 , height = 40}
  buttonUpg3 = {name = "Upgrade 3",x = 5,y = 190, width = 200 , height = 40}
  buttonUpg4 = {name = "Upgrade 4",x = 5,y = 260, width = 200 , height = 40}
  buttonUpg5 = {name = "Upgrade 5",x = 5,y = 330, width = 200 , height = 40}
  buttonUpg6 = {name = "Upgrade 6",x = 5,y = 400, width = 200 , height = 40}

  font_begin = love.graphics.newFont(32)
  font_ingame = love.graphics.newFont(15)
  font_cookie = love.graphics.newFont(20)
  font_button = love.graphics.newFont(32)
  font_upgrade_title = love.graphics.newFont(40)



  cookie_prin = love.graphics.newImage("images/cookie_images/cookie_160px.png")

  C_of_cookie = love.graphics.newImage("images/tilte_images_cookie/1_C_of_cookie.png")
  O_of_cookie = love.graphics.newImage("images/tilte_images_cookie/2_O_of_cookie.png")
  O_of_cookie_2 = love.graphics.newImage("images/tilte_images_cookie/3_O_of_cookie_2.png")
  K_of_cookie = love.graphics.newImage("images/tilte_images_cookie/4_K_of_cookie.png")
  I_of_cookie = love.graphics.newImage("images/tilte_images_cookie/5_I_of_cookie.png")
  E_of_cookie = love.graphics.newImage("images/tilte_images_cookie/6_E_of_cookie.png")

  C_of_clicker = love.graphics.newImage("images/title_images_clicker/1_C_of_clicker.png")
  L_of_clicker = love.graphics.newImage("images/title_images_clicker/2_L_of_clicker.png")
  I_of_clicker = love.graphics.newImage("images/title_images_clicker/3_I_of_clicker.png")
  C_of_clicker = love.graphics.newImage("images/title_images_clicker/4_C_of_clicker_2.png")
  K_of_clicker = love.graphics.newImage("images/title_images_clicker/5_K_of_clicker.png")
  E_of_clicker = love.graphics.newImage("images/title_images_clicker/6_E_of_clicker.png")
  R_of_clicker = love.graphics.newImage("images/title_images_clicker/7_R_of_clicker.png")

end

function love.update(dt)
  -- Initialisation des variables
  mouse_X = love.mouse.getX()
  mouse_Y = love.mouse.getY()

  cookie_count_total = cookie_count + level_upg_1*(10 + price_upg_1/10)

  if page == BEGGINING_PAGE then
-- Detection collision entre le curseur et le bouton play
    collisionCursWithButtonPlay()
-- Detection collision entre le curseur et le bouton Setting
    collisionCursWithButtonSetting()
-- Detection collision entre le curseur et le bouton Exit
    collisionCursWithButtonExit()
  end

  if page == INGAME_PAGE or UPGRADE_PAGE then

-- Detection collision entre le curseur et le cookie
    collisionCursWithCookie()
-- Detection collision entre le curseur et le bouton Upgrade
    collisionCursWithButtonGoToUpg()    
-- Detection collision entre le curseur et le bouton ExitUpgrade
    collisionCursWithButtonExitUpg()
-- Detection collision entre le curseur et le bouton Upg1 
    collisionCursWithButtonUpg1()
-- Detection collision entre le curseur et le bouton Upg2 
    collisionCursWithButtonUpg2()
-- Detection collision entre le curseur et le bouton Upg3
    collisionCursWithButtonUpg3()
-- Detection collision entre le curseur et le bouton Upg4
    collisionCursWithButtonUpg4()
-- Detection collision entre le curseur et le bouton Upg5
    collisionCursWithButtonUpg5()
-- Detection collision entre le curseur et le bouton Upg6
    collisionCursWithButtonUpg6()
-- Detection collision entre le curseur et le bouton Stat 
    collisionCursWithButtonStat()


-- Effet dynamique du cookie quand on clique dessus
    if love.mouse.isDown('1') and mouse_on_cookie then
      click_on_cookie = true
    else
      click_on_cookie = false
    end

-- Nombre de cookie par seconde
    cookie_count = cookie_count + cookie_per_second*dt -- nombre de cookie par seconde
-- Calculer le temps
    time_sec = time_sec + 1*dt
    cookie_max_count = cookie_max_count + cookie_per_second*dt

  end


  -- Cette boucle marche toujours sauf si on nest dans le menu demarrer
  if page == INGAME_PAGE or page == UPGRADE_PAGE or page == STAT_PAGE then

-- Bar settings (IMPORTANTE REFERENCE POUR LE FUTUR)

    if rectBoostBar.width > max_width_bar  then
      max_width_bar = rectBoostBar.width
    end

    if rectBoostBar.width <= 500 and max_width_bar < 500 then
      rectBoostBar.width = rectBoostBar.width + BoostBar.width/(barTime + 0.5)*dt

    end

    if rectBoostBar.width >= 0 and max_width_bar > 500 then
      rectBoostBar.width = rectBoostBar.width - ((BoostBar.width/(barTime + 0.5)*rectBoostBar.consumeBar)*dt)
      barInConsume = true
    else
      barInConsume = false
      max_width_bar = 0
    end
-- End bar settings
  end

end

function love.draw()
------------------------------------------------- 
  if page == BEGGINING_PAGE then

    love.graphics.setFont(font_begin)

    love.graphics.setBackgroundColor(0,255,255)

-- Setting(graphique) image title
    love.graphics.draw(C_of_cookie , cookie_title_x , 30,0,1,1)
    love.graphics.draw(O_of_cookie , cookie_title_x + 50 , 30,0,1,1)
    love.graphics.draw(O_of_cookie_2 , cookie_title_x + 100 , 30,0,1,1)
    love.graphics.draw(K_of_cookie , cookie_title_x + 150 , 30,0,1,1)
    love.graphics.draw(I_of_cookie , cookie_title_x + 200 , 30,0,1,1)
    love.graphics.draw(E_of_cookie , cookie_title_x + 250 , 30,0,1,1)

    love.graphics.draw( C_of_clicker , clicker_title_x , 100 , 0,1,1)
    love.graphics.draw( L_of_clicker , clicker_title_x + 50 , 100 , 0,1,1)
    love.graphics.draw( I_of_clicker , clicker_title_x + 100 , 100 , 0,1,1)
    love.graphics.draw( C_of_clicker , clicker_title_x + 150 , 100 , 0,1,1)
    love.graphics.draw( K_of_clicker , clicker_title_x + 200 , 100 , 0,1,1)
    love.graphics.draw( E_of_clicker , clicker_title_x + 250 , 100 , 0,1,1)
    love.graphics.draw( R_of_clicker , clicker_title_x + 300, 100 , 0,1,1)

-- End setting(graphique) image title

    love.graphics.setColor(96,96,96)
    love.graphics.rectangle('fill',100,325,400,300)
    love.graphics.setColor(255,255,255)


-- Setting(graphics) general for every button
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle('fill' , buttonPlay.x , buttonPlay.y , buttonPlay.width , buttonPlay.height )
    love.graphics.rectangle('fill' , buttonSetting.x , buttonSetting.y , buttonSetting.width , buttonSetting.height )
    love.graphics.rectangle('fill' , buttonExit.x , buttonExit.y , buttonExit.width , buttonExit.height )

    love.graphics.setColor(255,255,255)
    love.graphics.print(buttonPlay.name, buttonPlay.x + buttonPlay.width/3, buttonPlay.y)
    love.graphics.print(buttonSetting.name, buttonSetting.x + buttonSetting.width/4.5, buttonSetting.y)
    love.graphics.print(buttonExit.name, buttonExit.x + buttonExit.width/3, buttonExit.y)
-- End setting(graphics) general for every button       

-- Setting(graphics) button play    
    if Hover_Button_Play then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonPlay.name, buttonPlay.x + buttonPlay.width/3, buttonPlay.y)
      love.graphics.setColor(255,255,255)
    end
-- End setting(graphics) button play

-- Setting(graphics) button settings
    if Hover_Button_Setting then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonSetting.name, buttonSetting.x + buttonSetting.width/4.5, buttonSetting.y)
      love.graphics.setColor(255,255,255)
    end
-- End setting(graphics) button setting

-- Setting(graphics) button Exit
    if Hover_Button_Exit then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonExit.name, buttonExit.x + buttonExit.width/3, buttonExit.y)
      love.graphics.setColor(255,255,255)
    end
-- End setting(graphics) button Exit

  end
-------------------------------------------------
  if page == INGAME_PAGE then

    love.graphics.setFont(font_ingame)

    love.graphics.setColor(0,0,0)
    love.graphics.print(page, 120,0)

    love.graphics.print(tostring(mouse_on_cookie),0,0)
    love.graphics.print(tostring(click_on_cookie),45,0)
    love.graphics.print(tostring(barInConsume),0,45)

    love.graphics.setFont(font_button)
    love.graphics.rectangle('fill' , buttonGoToUpg.x , buttonGoToUpg.y , buttonGoToUpg.width , buttonGoToUpg.height)
    love.graphics.rectangle('fill' , buttonStat.x , buttonStat.y , buttonStat.width , buttonStat.height)

    love.graphics.setColor(255,255,255)
    love.graphics.print(buttonGoToUpg.name, buttonGoToUpg.x + buttonGoToUpg.width/6, buttonGoToUpg.y)
    love.graphics.print(buttonStat.name, buttonStat.x + buttonStat.width/3, buttonStat.y)

    if Hover_Button_Go_To_Upg then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonGoToUpg.name, buttonGoToUpg.x + buttonGoToUpg.width/6, buttonGoToUpg.y)
      love.graphics.setColor(255,255,255)
    end

    if Hover_Button_stat then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonStat.name, buttonStat.x + buttonStat.width/3, buttonStat.y)
      love.graphics.setColor(255,255,255)
    end


    love.graphics.setFont(font_cookie)
    love.graphics.print(math.floor(cookie_count).."  COOKIE(S)",WIN_WIDTH/3 + 25,WIN_HEIGHT/4)

    if click_on_cookie and mouse_on_cookie then
      love.graphics.draw(cookie_prin,Cookie.x - Cookie.width/2,Cookie.y - Cookie.height/2,0,1.05,1.05)
    else
      love.graphics.draw(cookie_prin,Cookie.x - Cookie.width/2,Cookie.y - Cookie.height/2,0,1,1)
    end


    love.graphics.setColor(192,192,192)
    love.graphics.rectangle('fill', BoostBar.x,BoostBar.y,BoostBar.width,BoostBar.height)
    love.graphics.setColor(255,126,0)
    love.graphics.rectangle('fill', rectBoostBar.x, rectBoostBar.y, rectBoostBar.width, rectBoostBar.height)
    love.graphics.setColor(255,255,255)



  end
-------------------------------------------------
  if page == UPGRADE_PAGE then
    love.graphics.setColor(0,0,0)

    love.graphics.setFont(font_upgrade_title)
    love.graphics.print("UPGRADE",WIN_WIDTH/3,0)
    love.graphics.print(math.floor(cookie_count).." COOKIE(S)",0,WIN_HEIGHT - 40)

    love.graphics.print(": "..level_upg_1,buttonUpg1.x + buttonUpg1.width + 20,buttonUpg1.y - 5)
    love.graphics.print("cost "..price_upg_1,buttonUpg1.x + buttonUpg1.width + 120,buttonUpg1.y - 5)

    love.graphics.print(": "..level_upg_2,buttonUpg2.x + buttonUpg2.width + 20,buttonUpg2.y - 5)
    love.graphics.print("cost "..price_upg_2,buttonUpg2.x + buttonUpg2.width + 120,buttonUpg2.y - 5)

    love.graphics.print(": "..level_upg_3,buttonUpg3.x + buttonUpg3.width + 20,buttonUpg3.y - 5)
    love.graphics.print("cost "..price_upg_3,buttonUpg3.x + buttonUpg3.width + 120,buttonUpg3.y - 5)

    love.graphics.print(": "..level_upg_4,buttonUpg4.x + buttonUpg4.width + 20,buttonUpg4.y - 5)
    love.graphics.print("cost "..price_upg_4,buttonUpg4.x + buttonUpg4.width + 120,buttonUpg4.y - 5)

    love.graphics.print(": "..level_upg_5,buttonUpg5.x + buttonUpg5.width + 20,buttonUpg5.y - 5)
    love.graphics.print("cost "..price_upg_5,buttonUpg5.x + buttonUpg5.width + 120,buttonUpg5.y - 5)

    love.graphics.print(": "..level_upg_6,buttonUpg6.x + buttonUpg6.width + 20,buttonUpg6.y - 5)
    love.graphics.print("cost "..price_upg_6,buttonUpg6.x + buttonUpg6.width + 120,buttonUpg6.y - 5)

    love.graphics.setFont(font_button)

    love.graphics.rectangle('fill' , buttonExitUpg.x , buttonExitUpg.y , buttonExitUpg.width , buttonExitUpg.height)
    love.graphics.rectangle('fill' , buttonUpg1.x , buttonUpg1.y , buttonUpg1.width , buttonUpg1.height)
    love.graphics.rectangle('fill' , buttonUpg2.x , buttonUpg2.y , buttonUpg2.width , buttonUpg2.height)
    love.graphics.rectangle('fill' , buttonUpg3.x , buttonUpg3.y , buttonUpg3.width , buttonUpg3.height)
    love.graphics.rectangle('fill' , buttonUpg4.x , buttonUpg4.y , buttonUpg4.width , buttonUpg4.height)
    love.graphics.rectangle('fill' , buttonUpg5.x , buttonUpg5.y , buttonUpg5.width , buttonUpg5.height)
    love.graphics.rectangle('fill' , buttonUpg6.x , buttonUpg6.y , buttonUpg6.width , buttonUpg6.height)


    love.graphics.setColor(255,255,255)
    love.graphics.print(buttonExitUpg.name, buttonExitUpg.x + buttonExitUpg.width/3, buttonExitUpg.y)
    love.graphics.print(buttonUpg1.name, buttonUpg1.x, buttonUpg1.y)
    love.graphics.print(buttonUpg2.name, buttonUpg2.x, buttonUpg2.y)
    love.graphics.print(buttonUpg3.name, buttonUpg3.x, buttonUpg3.y)
    love.graphics.print(buttonUpg4.name, buttonUpg4.x, buttonUpg4.y)
    love.graphics.print(buttonUpg5.name, buttonUpg5.x, buttonUpg5.y)
    love.graphics.print(buttonUpg6.name, buttonUpg6.x, buttonUpg6.y)


    if Hover_Button_Exit_Upg then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonExitUpg.name, buttonExitUpg.x + buttonExitUpg.width/3, buttonExitUpg.y)
      love.graphics.setColor(255,255,255)
    end

    if Hover_Button_Upg_1 then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonUpg1.name, buttonUpg1.x, buttonUpg1.y)
      love.graphics.setColor(255,255,255)
    end

    if Hover_Button_Upg_2 then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonUpg2.name, buttonUpg2.x, buttonUpg2.y)
      love.graphics.setColor(255,255,255)
    end

    if Hover_Button_Upg_3 then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonUpg3.name, buttonUpg3.x, buttonUpg3.y)
      love.graphics.setColor(255,255,255)
    end

    if Hover_Button_Upg_4 then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonUpg4.name, buttonUpg4.x, buttonUpg4.y)
      love.graphics.setColor(255,255,255)
    end

    if Hover_Button_Upg_5 then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonUpg5.name, buttonUpg5.x, buttonUpg5.y)
      love.graphics.setColor(255,255,255)
    end

    if Hover_Button_Upg_6 then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonUpg6.name, buttonUpg6.x, buttonUpg6.y)
      love.graphics.setColor(255,255,255)
    end




  end
-------------------------------------------------
  if page == STAT_PAGE then

    love.graphics.setFont(font_button)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle('fill' , buttonExitUpg.x , buttonExitUpg.y , buttonExitUpg.width , buttonExitUpg.height)
    love.graphics.setColor(255,255,255)
    love.graphics.print(buttonExitUpg.name, buttonExitUpg.x + buttonExitUpg.width/3, buttonExitUpg.y)

    if Hover_Button_Exit_Upg then
      love.graphics.setColor(204,204,0)
      love.graphics.print(buttonExitUpg.name, buttonExitUpg.x + buttonExitUpg.width/3, buttonExitUpg.y)
      love.graphics.setColor(255,255,255)
    end

    if cookie_count > cookie_max_count then
      cookie_max_count = cookie_count
    end


    love.graphics.print("Cookie per second : "..cookie_per_second,0,0)
    love.graphics.print("Current nb cookies : "..math.floor(cookie_count),0,40)
    love.graphics.print("Total nb cookies : "..math.floor(cookie_max_count),0,80)
    love.graphics.print("Cookie(s) per click : "..cookie_per_click,0,120)
    love.graphics.print("Finger click : "..nb_finger_click,0,160)
    love.graphics.print("Cookie mult : x"..cookie_click_mult,0,200)


-- Chronometre
    if time_min < 1 then
      love.graphics.print("Time carrer : "..math.floor(time_sec).." seconds",0,240)
    end

    if time_min > 0 and time_hours <= 0 then 
      love.graphics.print("Time carrer : "..time_min.."m "..math.floor(time_sec).." seconds",0,240)
    end

    if time_hours > 0 then
      love.graphics.print("Time carrer : "..time_hours.."h "..time_min.."m "..math.floor(time_sec).."s",0,240)
    end
-- Fin Chronometre


  end

-------------------------------------------------
  if page == SETTING_PAGE then



  end
-------------------------------------------------Work always in the program
-- Setup chronometre
  if math.floor(time_sec) / 60 == 1 then
    time_min = time_min + 1
    time_sec = 0
  end

  if time_min / 60 == 1 then
    time_hours = time_hours + 1
    time_min = 0
  end
end
--fin setup chronometre
--------------------------------------------------

function love.mousepressed(x,y,button,istouch)

  if button == 1 and mouse_on_cookie then
    cookie_count = cookie_count + cookie_per_click
    nb_finger_click = nb_finger_click + 1
    cookie_max_count = cookie_max_count + cookie_per_click
  end

  if button == 1 and Hover_Button_Play and page == BEGGINING_PAGE then
    page = INGAME_PAGE
  end

  if button == 1 and Hover_Button_Setting and page == BEGGINING_PAGE then
    page = SETTING_PAGE
  end

  if button == 1 and Hover_Button_Exit and page == BEGGINING_PAGE then
    love.event.quit()
  end  

  if button == 1 and Hover_Button_Go_To_Upg and page == INGAME_PAGE then
    page = UPGRADE_PAGE
  end

  if button == 1 and Hover_Button_stat and page == INGAME_PAGE then
    page = STAT_PAGE
  end


  if button == 1 and Hover_Button_Exit_Upg then
    page = INGAME_PAGE
  end

  if button == 1 and Hover_Button_Upg_1 and cookie_count >= price_upg_1 and page == UPGRADE_PAGE then
    cookie_count = cookie_count - price_upg_1
    level_upg_1 = level_upg_1 + 1
    price_upg_1 = price_upg_1 + math.ceil(price_upg_1/10)
    cookie_per_second = cookie_per_second + 0.1
  end

  if button == 1 and Hover_Button_Upg_2 and cookie_count >= price_upg_2 and page == UPGRADE_PAGE then
    cookie_count = cookie_count - price_upg_2
    level_upg_2 = level_upg_2 + 1
    price_upg_2 = price_upg_2 + math.ceil(price_upg_2/10)
    cookie_per_second = cookie_per_second + 0.5
  end

  if button == 1 and Hover_Button_Upg_3 and cookie_count >= price_upg_3 and page == UPGRADE_PAGE then
    cookie_count = cookie_count - price_upg_3
    level_upg_3 = level_upg_3 + 1
    price_upg_3 = price_upg_3 + math.ceil(price_upg_3/10)
    cookie_per_second = cookie_per_second + 3
  end

  if button == 1 and Hover_Button_Upg_4 and cookie_count >= price_upg_4 and page == UPGRADE_PAGE then
    cookie_count = cookie_count - price_upg_4
    level_upg_4 = level_upg_4 + 1
    price_upg_4 = price_upg_4 + math.ceil(price_upg_4/10)
    cookie_per_second = cookie_per_second + 10
  end

  if button == 1 and Hover_Button_Upg_5 and cookie_count >= price_upg_5 and page == UPGRADE_PAGE then
    cookie_count = cookie_count - price_upg_5
    level_upg_5 = level_upg_5 + 1
    price_upg_5 = price_upg_5 + math.ceil(price_upg_5/10)
    cookie_per_second = cookie_per_second + 50
  end

  if button == 1 and Hover_Button_Upg_6 and cookie_count >= price_upg_6 and page == UPGRADE_PAGE then
    cookie_count = cookie_count - price_upg_6
    level_upg_6 = level_upg_6 + 1
    price_upg_6 = price_upg_6 + math.ceil(price_upg_6/10)
    cookie_per_second = cookie_per_second + 150
  end

  if barInConsume then
    cookie_per_click = cookie_per_click_mult*4
  else
    cookie_per_click = cookie_per_click_mult
  end

end

function love.keypressed(key)

  if key == 'escape' then
    love.event.quit()
  end

  if key == 'u' and page == INGAME_PAGE then
    page = UPGRADE_PAGE
  end

end

function love.mousereleased()

end