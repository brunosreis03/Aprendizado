Before do #Page Objects
  @alert = Alert.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new

  #page.driver.browser.manage.window.maximize comando do capybara para automatizar com o browser em tela cheia
  page.current_window.resize_to(1440, 900) #comando do capybara q trabalha com o tamanho mínimo da janela necessário de acordo com o projeto
end

After do
  temp_shot = page.save_screenshot("logs/temp_screenshot.png") #tira um screenshot dps dos steps "Entao", armazena nesse arquivo temporario e salva nessa variável

  Allure.add_attachment( #Método do allure q adiciona anexo (recebe 3 argumentos em formato de símbolo)
    name: "ScreenShot",   #link para acessar a foto no relatório
    type: Allure::ContentType::PNG, #tipo de arquivo q está sendo anexado
    source: File.open(temp_shot),   #abre o arquivo
  )
end
