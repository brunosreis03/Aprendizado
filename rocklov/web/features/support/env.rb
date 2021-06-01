require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}")) #módulo do ruby pra carregar arquivos no formato yml. Recurso do ruby que acessa as variaveis do ambiente

case ENV["BROWSER"] # define o browser para realizacao dos testes multibrowser

when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "fire_headless"
  @driver = :selenium_headless
when "chrome_headless"
  @driver = :selenium_chrome_headless
else
  raise "Navegador incorreto, variável @driver está vazia :(" #aborta o processo mostrando essa mensagem
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["url"]  # consegue definir a url padrão do sistema a ser testado
  config.default_max_wait_time = 10 #capybara terá 5s para encontrar os elementos. OBS: padrão é 2s
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs" #resultados na pasta logs
  config.clean_results_directory = true #sempre que for executado, o allure vai limpar a pasta log
end
