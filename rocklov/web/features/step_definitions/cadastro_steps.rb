Dado("que acesso a página de cadastro") do
  @signup_page.open
end

Quando("submeto o seguinte formulário de cadastro:") do |table|
  user = table.hashes.first               #converte tabela pra o ruby e pega o primeiro elemento
  MongoDB.new.remove_user(user[:email])
  @signup_page.create(user)

  click_button "Cadastrar"
end
