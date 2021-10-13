
function CreateButton()

  general_width = 40
  general_height = 30

  button_no_0 = Button.New()
  button_no_0.x = WIN_WIDTH/16
  button_no_0.y = WIN_HEIGHT - WIN_HEIGHT/24
  button_no_0.width = general_width
  button_no_0.height = general_height


end

function CreateForms()

  cal_bar = Form.New()
  cal_bar.x = 0
  cal_bar.y = 30
  cal_bar.width = WIN_WIDTH
  cal_bar.height = 30
  cal_bar.id = 1

end

Button = {

  x = 0,
  y = 0,
  width = 0,
  height = 0,
  value = 0,
  id = 0,


  New = function()

    nb_ins_button = nb_ins_button + 1

    button = {}

    button.x = Button.x
    button.y = Button.y
    button.width = Button.width
    button.height = Button.height
    button.value = Button.value
    button.id = Button.id

    return button

  end

}

Form = {

  x = 0,
  y = 0,
  width = 0,
  height = 0,
  id = 0,

  New = function()

    nb_ins_form = nb_ins_form + 1

    local form = {}
    form.x = Form.x
    form.y = Form.y
    form.width = Form.width
    form.height = Form.height
    form.id = Form.id

    return form

  end,



}


function love.load()
  -- Variable qui revoie le nombre d instance de chaque constructeur
  nb_ins_button = 0
  nb_ins_form = 0

  CreateButton()
  CreateForms()
end

function love.update(dt)




end

function love.draw()

  love.graphics.setBackgroundColor(128,128,128)
  love.graphics.setColor(224,224,224)
  love.graphics.rectangle('fill', cal_bar.x, cal_bar.y, cal_bar.width, cal_bar.height)

  love.graphics.setColor(0,0,0)
  for i = 0, nb_ins_button, 1 do
    love.graphics.rectangle('fill',button_no_0.x,button_no_0.y,button_no_0.width,button_no_0.height)
  end

end


function love.keypressed()

end

function love.keyreleased()

end
