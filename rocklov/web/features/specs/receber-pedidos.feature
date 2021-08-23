#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo um anunciante que possui equipamentos cadastrados
    Desejo receber pedidos de locacao
    Para que eu possa decidir se quero aprova-los ou rejeita-los

    @temp
    Cenario: Receber pedido
        Dado que meu perfil de anunciante é "joao@anunciante.com" e "010203"
            E que eu tenho o seguinte equipamento cadastrado:
            | thumb     | trompete.jpg |
            | nome      | Trompete     |
            | categoria | Outros       |
            | preco     | 100          |
            E acesso o meu Dashboard
        Quando "maria@locataria.com" e "010203" solicita a locacao desse equipamento
        Entao devo ver a seguinte mensagem:
        """ 
        maria@locataria.com deseja alugar o equipamento: Trompete em: DATA_ATUAL
        """
        E devo ver os links: "ACEITAR" e "REJEITAR" no pedido

   