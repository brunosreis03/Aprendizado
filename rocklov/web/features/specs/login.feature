#language: pt

Funcionalidade: Login

    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "bruninhosreis@gmail.com" e "Kost010203"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input             | senha_input | mensagem_output                  |
            | bruninhosreis@gmail.com | kost010204  | Usuário e/ou senha inválidos.    |
            | bruno03@gmail.com       | Kost010203  | Usuário e/ou senha inválidos.    |
            | bruninhosreis&gmail.com | Kost010203  | Oops. Informe um email válido!   |
            |                         | Kost010203  | Oops. Informe um email válido!   |
            | bruninhosreis@gmail.com |             | Oops. Informe sua senha secreta! |
