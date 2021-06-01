describe "POST /signup" do
  context "novo usuario" do
    before(:all) do #roda 1 vez para todos os contextos
      payload = { name: "Joao", email: "Joao@gmail.com", password: "010203" }
      MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200 #validando o status code
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24 #altera de "response" pra "hash"
    end
  end

  examples = Helpers::get_fixture("signup")

  examples.each do |e| # percorre 1 exemplo do array por vez
    context "#{e[:title]}" do # nome de cada titulo de acordo com os exemplos do array
      before(:all) do #roda 1 vez para todos os contextos
        @result = Signup.new.create(e[:payload])     #chama o resultado do exemplo
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
