describe "POST /equipos/{equipo_id}/bookings" do
  before(:all) do
    payload = { email: "ed@gmail.com", password: "010203" }
    result = Sessions.new.login(payload)
    @ed_id = result.parsed_response["_id"]
  end

  context "solicitar locacao" do
    before(:all) do

      #dado que Fabio tem um Fender Strato para locacao

      result = Sessions.new.login({ email: "fabio@gmail.com", password: "010203" })
      fabio_id = result.parsed_response["_id"]

      fender = {
        thumbnail: Helpers::get_thumb("fender-sb.jpg"),
        name: "Fender Strato",
        category: "Cordas",
        price: 150,
      }
      MongoDB.new.remove_equipo(fender[:name], fabio_id)

      result = Equipos.new.create(fender, fabio_id)
      fendder_id = result.parsed_response["_id"]

      #quando solicito a locacao da Fender do Joe Perry
      @result = Equipos.new.booking(fendder_id, @ed_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
