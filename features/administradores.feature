# language: pt

Funcionalidade: Cadastro de Administrador
  Como um usuário do sistema
  Quero ser capaz de cadastrar administrar os administradores do sistema

  # @javascript
  Cenário: Cadastro bem-sucedido de um novo administrador
    Dado que eu estou na página de cadastro de administradores
    Quando eu preencher todos os campos obrigatórios com informações válidas
    E eu clicar no botão "Salvar"
    Então um novo administrador deve ser criado
    E uma mensagem de confirmação deve ser exibida

  # @javascript
  Cenário: Apagar um administrador existente
    Dado que eu tenho um administrador cadastrado
    Quando eu acesso a página de exclusão do administrador
    E eu clicar no botão "Destroy this administrador"
    Então o administrador não deve mais existir
    E tenho que ver a mensagem de administrador excluido

  Cenário: Alterar um administrador existente
    Dado que eu tenho um administrador cadastrado
    Quando eu acesso a página de alteração do administrador
    E eu preencher todos os campos obrigatórios com informações válidas
    E eu clicar no botão "Salvar"
    Então o administrador deve ser alterado
    E uma mensagem alteração deve ser exibida