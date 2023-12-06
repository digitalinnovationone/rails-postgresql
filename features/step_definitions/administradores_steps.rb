

Dado('que eu estou na página de cadastro de administradores') do
  visit new_administrador_url
end

Quando('eu preencher todos os campos obrigatórios com informações válidas') do
  fill_in "Email", with: "usuario@cubumber.com"
  fill_in "Nome", with: "Cucumber"
  fill_in "Senha", with: "capybara"
end

Quando('eu clicar no botão {string}') do |string|
  click_on string, match: :first
end

Então('um novo administrador deve ser criado') do
  expect(Administrador.where(email: "usuario@cubumber.com")).not_to be_empty
end

Então('uma mensagem de confirmação deve ser exibida') do
  expect(page).to have_text("Administrador foi criado com sucesso.")
end

Dado('que eu tenho um administrador cadastrado') do
  @adm = Administrador.create!(nome: "Adm Cucumber", email: "adm-cucumber@teste.com", senha: "1234")
end

Quando('eu acesso a página de exclusão do administrador') do
  visit administrador_url(@adm)
end

Então('o administrador não deve mais existir') do
  expect(Administrador.where(email: "adm-cucumber@teste.com")).to be_empty
end

Então('tenho que ver a mensagem de administrador excluido') do
  expect(page).to have_text("Administrador was successfully destroyed")
end

Quando('eu acesso a página de alteração do administrador') do
  visit edit_administrador_url(@adm)
end

Então('o administrador deve ser alterado') do
  expect(Administrador.where(email: "usuario@cubumber.com")).to_not be_empty
end

Então('uma mensagem alteração deve ser exibida') do
  expect(page).to have_text("Administrador was successfully updated")
end