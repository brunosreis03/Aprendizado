require_relative "base_api"

class Equipos < BaseApi
  def create(payload, user_id)
    return self.class.post( #tem acesso aos objetos da própria classe
             "/equipos",
             body: payload,
             headers: {
               "user_id": user_id, #após inspecionar o site, verificou-se q o form data n era .json, por isso a alteracao
             },
           )
  end

  def find_by_id(equipo_id, user_id)
    return self.class.get(
             "/equipos/#{equipo_id}",
             headers: {
               "user_id": user_id,
             },
           )
  end

  def list(user_id)
    return self.class.get(
             "/equipos",
             headers: {
               "user_id": user_id,
             },
           )
  end

  def remove_by_id(equipo_id, user_id)
    return self.class.delete(
             "/equipos/#{equipo_id}",
             headers: {
               "user_id": user_id,
             },
           )
  end

  def booking(equipo_id, user_locator_id)
    return self.class.post(
             "/equipos/#{equipo_id}/bookings",
             body: { date: Time.now.strftime("%d/%m/%Y") }.to_json, #pega data no sistema no formato da aplicacao
             headers: {
               "user_id": user_locator_id,
             },
           )
  end
end
