require "application_system_test_case"

class FornecedoresEnderecosTest < ApplicationSystemTestCase
  setup do
    @fornecedores_endereco = fornecedores_enderecos(:one)
  end

  test "visiting the index" do
    visit fornecedores_enderecos_url
    assert_selector "h1", text: "Fornecedores endereco"
  end

  test "should create fornecedores endereco" do
    visit fornecedores_enderecos_url
    click_on "New fornecedores endereco"

    fill_in "Endereco", with: @fornecedores_endereco.endereco_id
    fill_in "Fornecedor", with: @fornecedores_endereco.fornecedor_id
    click_on "Create Fornecedores endereco"

    assert_text "Fornecedores endereco was successfully created"
    click_on "Back"
  end

  test "should update Fornecedores endereco" do
    visit fornecedores_endereco_url(@fornecedores_endereco)
    click_on "Edit this fornecedores endereco", match: :first

    fill_in "Endereco", with: @fornecedores_endereco.endereco_id
    fill_in "Fornecedor", with: @fornecedores_endereco.fornecedor_id
    click_on "Update Fornecedores endereco"

    assert_text "Fornecedores endereco was successfully updated"
    click_on "Back"
  end

  test "should destroy Fornecedores endereco" do
    visit fornecedores_endereco_url(@fornecedores_endereco)
    click_on "Destroy this fornecedores endereco", match: :first

    assert_text "Fornecedores endereco was successfully destroyed"
  end
end
