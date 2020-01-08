#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catálogo NinjaFlix
    Sendo um usuario previamente cadastrado
    Posso acessar o sistema com o meu email e senha

    @loginF
    Cenario: Acesso
        Quando eu faço o login com "tony@stark.com" e "pwd123"
        Então devo ser autenticado
        E devo ver "Tony Stark" na área logada

@lg
    Esquema do Cenario: Login sem sucesso
        Quando eu faço o login com <email> e <senha>
        Entao não devo ser autenticado
        E devo ver a mensagem de alerta <texto>
        
        Exemplos:
            | email             | senha     | texto                          |
            | "tony@stark.com"  | "abc123"  | "Usuário e/ou senha inválidos" |
            | "404@yahoo.com"   | "abc123"  | "Usuário e/ou senha inválidos" |
            | ""                | "abcxpto" | "Opps. Cadê o email?"          |
            | "teste@gmail.com" | ""        | "Opps. Cadê a senha?"          |
