require "test_helper"

class AdministradorTest < ActiveSupport::TestCase
  def setup
    @administrador = Administrador.new(nome: "Luiz", email: "lu@gmail.com", senha: "12345")
  end

  test "deve ter o o objeto Administrador valido" do
    # Arrange
    administrador = Administrador.new(nome: "Luiz", email: "lu@gmail.com", senha: "12345")

    # Act
    valido = administrador.valid?

    # Assert
    assert valido
  end

  test "deve ser um nome inválido" do
    @administrador.nome = ""
    assert_not @administrador.valid?
  end

  test "deve ser um email inválido" do
    @administrador.email = ""
    assert_not @administrador.valid?
  end

  test "deve ser uma senha inválida" do
    @administrador.senha = ""
    assert_not @administrador.valid?
  end

  test "deve ser um nome inválido com caracteres a mais" do
    @administrador.nome = "a" * 151
    assert_not @administrador.valid?
  end

  test "deve ser um email inválido com caracteres a mais" do
    @administrador.email = "a" * 256
    assert_not @administrador.valid?
  end

  test "deve ser uma senha inválida com caracteres a mais" do
    @administrador.senha = "a" * 256
    assert_not @administrador.valid?
  end
end
