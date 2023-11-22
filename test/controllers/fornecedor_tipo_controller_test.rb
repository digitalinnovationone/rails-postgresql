require "test_helper"

class FornecedorTipoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fornecedor_tipo = fornecedor_tipo(:one)
  end

  test "should get index" do
    get fornecedor_tipo_index_url
    assert_response :success
  end

  test "should get new" do
    get new_fornecedor_tipo_url
    assert_response :success
  end

  test "should create fornecedor_tipo" do
    assert_difference("FornecedorTipo.count") do
      post fornecedor_tipo_index_url, params: { fornecedor_tipo: { nome: @fornecedor_tipo.nome } }
    end

    assert_redirected_to fornecedor_tipo_url(FornecedorTipo.last)
  end

  test "should show fornecedor_tipo" do
    get fornecedor_tipo_url(@fornecedor_tipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_fornecedor_tipo_url(@fornecedor_tipo)
    assert_response :success
  end

  test "should update fornecedor_tipo" do
    patch fornecedor_tipo_url(@fornecedor_tipo), params: { fornecedor_tipo: { nome: @fornecedor_tipo.nome } }
    assert_redirected_to fornecedor_tipo_url(@fornecedor_tipo)
  end

  test "should destroy fornecedor_tipo" do
    assert_difference("FornecedorTipo.count", -1) do
      delete fornecedor_tipo_url(@fornecedor_tipo)
    end

    assert_redirected_to fornecedor_tipo_index_url
  end
end
