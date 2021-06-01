module Helpers
  def get_fixture(item)
    YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true) #massa de teste em arquivo separado
    #transforma cada campo em um simbolo para funcionar através do :simbolo
  end

  def get_thumb(file_name)
    return File.open(File.join(Dir.pwd, "spec/fixtures/images", file_name), "rb") #argumento que faltou pra obter o conteúdo completo dentro da variavel thumbnail
  end

  module_function :get_thumb
  module_function :get_fixture
end
