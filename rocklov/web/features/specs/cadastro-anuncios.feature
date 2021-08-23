#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibiliza-los para locacao

    Contexto: Novo equipo
        * Login com "bruno@gmail.com" e "kost010203"

    Cenario: Novo equipo
        Dado que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Entao devo ver esse item no meu Dashboard

    Esquema do Cenario: Tentativa de cadastro de anúncios

        Dado que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Entao deve conter a mensagem de alerta: "<saida>"

        Exemplos:
            | foto          | nome              | categoria | preco | saida                                |
            |               | Violao de Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!      |
            | mic.jpg       | Microfone Shure   |           | 100   | Informe a categoria                  |
            | trompete.jpg  | Trompete Clássico | Outros    |       | Informe o valor da diária            |
            | conga.jpg     | Conga             | Outros    | abc   | O valor da diária deve ser numérico! |
            | conga.jpg     | Conga             | Outros    | 100a  | O valor da diária deve ser numérico! |