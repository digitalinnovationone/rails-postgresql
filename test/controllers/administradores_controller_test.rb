require "test_helper"

class AdministradoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrador = administradores(:one)
  end

  test "should get index" do
    get administradores_url
    assert_response :success
  end

  test "should get new" do
    get new_administrador_url
    assert_response :success
  end

  test "should create administrador" do
    assert_difference("Administrador.count") do
      post administradores_url, params: { administrador: { email: @administrador.email, nome: @administrador.nome, senha: @administrador.senha } }
    end

    assert_redirected_to administrador_url(Administrador.last)
  end

  test "se o admiministrador passou pelo preparar" do
    post administradores_url, params: { administrador: { email: @administrador.email, nome: @administrador.nome, senha: @administrador.senha } }
    assert_response 302
    assert Administrador.where(nome: @administrador.nome + "- teste").count > 0
  end

  test "should show administrador" do
    get administrador_url(@administrador)
    assert_response :success
  end

  test "should get edit" do
    get edit_administrador_url(@administrador)
    assert_response :success
  end

  test "should update administrador" do
    patch administrador_url(@administrador), params: { administrador: { email: @administrador.email, nome: @administrador.nome, senha: @administrador.senha } }
    assert_redirected_to administrador_url(@administrador)
  end

  test "should destroy administrador" do
    assert_difference("Administrador.count", -1) do
      delete administrador_url(@administrador)
    end

    assert_redirected_to administradores_url
  end
end
