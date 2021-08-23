#language: pt

Funcionalidade: Remover Anúncios
    Sendo um anunciante que possui um equipamento indesejado
    Quero poder remover esse anúncio
    Para que eu possa manter o meu Dashboard atualizado

    Contexto:
        * Login com "spider@gmail.com" e "010203"

    
    Cenario: Remover um anúncio
        Dado que eu tenho um anúncio indesejado
            | thumb     | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 50             |
        Quando eu solicito a exclusão desse item
            E confirmo a exclusão
        Entao não devo ver esse item no meu Dashboard

    
    Cenario: Desistir da exclusão
        Dado que eu tenho um anúncio indesejado
            | thumb     | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros    |
            | preco     | 100       |
        Quando eu solicito a exclusão desse item
            Mas não confirmo a solicitacão
        Entao devo ver o anúncio no meu Dashboard