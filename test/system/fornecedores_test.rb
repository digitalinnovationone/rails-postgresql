require "application_system_test_case"

class FornecedoresTest < ApplicationSystemTestCase
  setup do
    @fornecedor = fornecedores(:one)
  end

  test "visiting the index" do
    visit fornecedores_url
    assert_selector "h1", text: "Fornecedores"
  end

  test "should create fornecedor" do
    visit fornecedores_url
    click_on "New fornecedor"

    fill_in "Cnpj", with: @fornecedor.cnpj
    fill_in "Endereco", with: @fornecedor.endereco
    fill_in "Nome", with: @fornecedor.nome
    click_on "Create Fornecedor"

    assert_text "Fornecedor was successfully created"
    click_on "Back"
  end

  test "should update Fornecedor" do
    visit fornecedor_url(@fornecedor)
    click_on "Edit this fornecedor", match: :first

    fill_in "Cnpj", with: @fornecedor.cnpj
    fill_in "Endereco", with: @fornecedor.endereco
    fill_in "Nome", with: @fornecedor.nome
    click_on "Update Fornecedor"

    assert_text "Fornecedor was successfully updated"
    click_on "Back"
  end

  test "should destroy Fornecedor" do
    visit fornecedor_url(@fornecedor)
    click_on "Destroy this fornecedor", match: :first

    assert_text "Fornecedor was successfully destroyed"
  end
end
