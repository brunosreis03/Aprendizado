Dado("Login com {string} e {string}") do |email, password|
  @email = email #pra ter acesso a informacao no outro Dado
  @login_page.open
  @login_page.with(email, password)

  #checkpoint para garantir q estamos no Dashboard
  expect(@dash_page.on_dash?).to be true
end

Dado("que acesso o formulario de cadastro de anúncios") do
  @dash_page.gotoequipo_form
end

Dado("que eu tenho o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash        #converte uma tabela de chave valor pra um objeto hash do ruby o @ transforma em uma variavel global
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipos_page.create(@anuncio)
end

Entao("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia" #chamar o preco citado no bdd
end

Entao("deve conter a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to have_content expect_alert
end

# Remover anúncios

Dado("que eu tenho um anúncio indesejado") do |table|
  user_id = page.execute_script("return localStorage.getItem('user')") #devolve o valor presente no local storage q representa o user id após logar na aplicacao (consumindo api post sessions)

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")

  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  EquiposService.new.create(@equipo, user_id)

  visit current_path #fazer um refresh na página pois quando tem mais de 1 item cadastrado e apagado manualmente, o frontend n reconhece a nova insercao
end

Quando("eu solicito a exclusão desse item") do
  @dash_page.request_removal(@equipo[:name])
end

Quando("confirmo a exclusão") do
  @dash_page.confirme_removal
end

Entao("não devo ver esse item no meu Dashboard") do
  expect(
    @dash_page.has_no_equipo?(@equipo[:name])
  ).to be true
end

Quando("não confirmo a solicitacão") do
  @dash_page.cancel_removal
end

Entao("devo ver o anúncio no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @equipo[:name]
end
