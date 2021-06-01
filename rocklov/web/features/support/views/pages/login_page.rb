class LoginPage
  include Capybara::DSL #falando pro ruby utlizar o capybara para abrir a pagina

  def open
    visit "/"
  end

  def with(email, password) #encapsula os métodos
    find("input[placeholder='Seu email']").set email
    find("input[type=password]").set password
    click_button "Entrar"
  end
end
