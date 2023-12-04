require 'test_helper'

class AdministradoresFlowTest < ActionDispatch::IntegrationTest
  test "pode criar um administrador" do
    get "/administradores/new"
    assert_response :success

    post "/administradores",
         params: { administrador: { nome: "Admin Teste", email: "admin@teste.com", senha: "senha123" } }

    assert_response :redirect

    follow_redirect!
    assert_response :success

    assert_select ".administrador_show" do
        assert_select "p>strong", "Nome:"
        assert_select "p", text: /Admin Teste- teste/
    end
  end

  test "pode visualizar um administrador" do
    administrador = administradores(:one) # assumindo que você tem uma fixture chamada 'one'
    get administrador_path(administrador)
    assert_select ".administrador_show" do
        assert_select "p>strong", "Nome:"
        assert_select "p", text: /Adm one/
    end
  end

  test "pode editar um administrador" do
    administrador = administradores(:one)

    get edit_administrador_path(administrador)
    assert_response :success

    patch administrador_path(administrador),
          params: { administrador: { nome: "Admin Editado", email: administrador.email, senha: administrador.senha } }
    assert_redirected_to administrador_path(administrador)
    follow_redirect!
    assert_select ".administrador_show" do
        assert_select "p>strong", "Nome:"
        assert_select "p", text: /Admin Editado/
    end
  end

  test "pode deletar um administrador" do
    administrador = administradores(:one)
    
    assert_difference('Administrador.count', -1) do
      delete administrador_path(administrador)
    end

    assert_redirected_to administradores_path
  end
end
