Dado("Login com {string} e {string}") do |email, password|
  @email = email #pra ter acesso a informacao no outro Dado
  @login_page.open
  @login_page.with(email, password)
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
