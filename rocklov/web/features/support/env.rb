require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"
require "mongo"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}")) #módulo do ruby pra carregar arquivos no formato yml. Recurso do ruby que acessa as variaveis do ambiente

case ENV["BROWSER"] # define o browser para realizacao dos testes multibrowser

when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "fire_headless"
  @driver = :selenium_headless
when "chrome_headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    version = Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.add_argument("--headless")
      opts.add_argument("--disable-gpu")
      opts.add_argument("--disable-site-isolation-trials")
      opts.add_argument("--no-sandbox") #
      opts.add_argument("--disable-dev-shm-usage") #usar recurso de cache em disco do q em memória
    end

    Capybara::Selenium::Driver.new(app, **{ :browser => :chrome, :options => browser_options })
  end

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
