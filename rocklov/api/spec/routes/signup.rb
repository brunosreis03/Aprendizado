require_relative "base_api"

class Signup < BaseApi
  def create(payload)
    return self.class.post( #tem acesso aos objetos da própria classe
             "/signup",
             body: payload.to_json,
             headers: {
               "Content-Type": "application/json", #informa qual o tipo de dado no cabecalho
             },
           )
  end
end
