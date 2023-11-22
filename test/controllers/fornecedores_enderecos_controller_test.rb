require "test_helper"

class FornecedoresEnderecosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fornecedores_endereco = fornecedores_enderecos(:one)
  end

  test "should get index" do
    get fornecedores_enderecos_url
    assert_response :success
  end

  test "should get new" do
    get new_fornecedores_endereco_url
    assert_response :success
  end

  test "should create fornecedores_endereco" do
    assert_difference("FornecedoresEndereco.count") do
      post fornecedores_enderecos_url, params: { fornecedores_endereco: { endereco_id: @fornecedores_endereco.endereco_id, fornecedor_id: @fornecedores_endereco.fornecedor_id } }
    end

    assert_redirected_to fornecedores_endereco_url(FornecedoresEndereco.last)
  end

  test "should show fornecedores_endereco" do
    get fornecedores_endereco_url(@fornecedores_endereco)
    assert_response :success
  end

  test "should get edit" do
    get edit_fornecedores_endereco_url(@fornecedores_endereco)
    assert_response :success
  end

  test "should update fornecedores_endereco" do
    patch fornecedores_endereco_url(@fornecedores_endereco), params: { fornecedores_endereco: { endereco_id: @fornecedores_endereco.endereco_id, fornecedor_id: @fornecedores_endereco.fornecedor_id } }
    assert_redirected_to fornecedores_endereco_url(@fornecedores_endereco)
  end

  test "should destroy fornecedores_endereco" do
    assert_difference("FornecedoresEndereco.count", -1) do
      delete fornecedores_endereco_url(@fornecedores_endereco)
    end

    assert_redirected_to fornecedores_enderecos_url
  end
end
