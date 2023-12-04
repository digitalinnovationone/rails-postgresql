require "test_helper"

class AdministradoresHelperTest < ActiveSupport::TestCase
  include AdministradoresHelper
  
  test "primeiro_administrador com administrador cadastrado" do
    # Arrange
    Administrador.destroy_all
    administrador01 = Administrador.create!(nome: "Teste", email: "teste@teste.com", senha: "senha123")
    administrador02 = Administrador.create!(nome: "Teste02", email: "teste02@teste.com", senha: "senha123")

    # Act
    adm_helper = primeiro_administrador

    # Assert
    assert_equal administrador01, adm_helper
  end

  test "primeiro_administrador sem administrador cadastrado" do
    # Arrange
    Administrador.destroy_all

    # Act
    adm_helper = primeiro_administrador

    # Assert
    assert_nil adm_helper.id
    assert_nil adm_helper.nome
    assert_nil adm_helper.email
    assert_nil adm_helper.senha
  end
end
  