require_relative "base_api"

class Sessions < BaseApi
  def login(payload)
    return self.class.post( #tem acesso aos objetos da própria classe
             "/sessions",
             body: payload.to_json,
             headers: {
               "Content-Type": "application/json", #informa qual o tipo de dado no cabecalho
             },
           )
  end
end
