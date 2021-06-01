describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do #roda 1 vez para todos os contextos
      payload = { email: "bruninhosreis@gmail.com", password: "Kost010203" }
      @result = Sessions.new.login(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200 #validando o status code
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24 #altera de "response" pra "hash"
    end
  end

  # examples = [ # massa de teste
  #   {
  #     title: "senha incorreta",
  #     payload: { email: "bruninhosreis@gmail.com", password: "Kost010204" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "usuario nao existe",
  #     payload: { email: "kost@gmail.com", password: "Kost010204" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "email em branco",
  #     payload: { email: "", password: "Kost010204" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "sem o campo email",
  #     payload: { password: "Kost010204" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "senha em branco",
  #     payload: { email: "bruninhosreis@gmail.com", password: "" },
  #     code: 412,
  #     error: "required password",
  #   },
  #   {
  #     title: "sem o campo senha",
  #     payload: { email: "bruninhosreis@gmail.com" },
  #     code: 412,
  #     error: "required password",
  #   },
  # ]

  examples = Helpers::get_fixture("login")

  examples.each do |e| # percorre 1 exemplo do array por vez
    context "#{e[:title]}" do # nome de cada titulo de acordo com os exemplos do array
      before(:all) do #roda 1 vez para todos os contextos
        @result = Sessions.new.login(e[:payload])     #chama o resultado do exemplo
      end

      it "valida status code #{e[:code]}" do #interpolando para aparecer os códigos
        expect(@result.code).to eql e[:code] #validando o status code
      end

      it "valida id do usuário" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
