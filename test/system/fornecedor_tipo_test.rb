require "application_system_test_case"

class FornecedorTipoTest < ApplicationSystemTestCase
  setup do
    @fornecedor_tipo = fornecedor_tipo(:one)
  end

  test "visiting the index" do
    visit fornecedor_tipo_url
    assert_selector "h1", text: "Fornecedor tipo"
  end

  test "should create fornecedor tipo" do
    visit fornecedor_tipo_url
    click_on "New fornecedor tipo"

    fill_in "Nome", with: @fornecedor_tipo.nome
    click_on "Create Fornecedor tipo"

    assert_text "Fornecedor tipo was successfully created"
    click_on "Back"
  end

  test "should update Fornecedor tipo" do
    visit fornecedor_tipo_url(@fornecedor_tipo)
    click_on "Edit this fornecedor tipo", match: :first

    fill_in "Nome", with: @fornecedor_tipo.nome
    click_on "Update Fornecedor tipo"

    assert_text "Fornecedor tipo was successfully updated"
    click_on "Back"
  end

  test "should destroy Fornecedor tipo" do
    visit fornecedor_tipo_url(@fornecedor_tipo)
    click_on "Destroy this fornecedor tipo", match: :first

    assert_text "Fornecedor tipo was successfully destroyed"
  end
end
